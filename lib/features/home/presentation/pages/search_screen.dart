import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/utils/location_service.dart';
import 'package:weather_app/core/utils/use_current_location.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/pages/home_screen.dart';
import 'package:weather_app/locator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

String normalizeCity(String name) {
  return name
      .replaceAll(RegExp(r'\bcounty\b', caseSensitive: false), '')
      .replaceAll(',', '')
      .trim();
}

class _SearchScreenState extends State<SearchScreen>
    with WidgetsBindingObserver {
  final TextEditingController controller = TextEditingController();
  final HomeRepository homeRepository = locator();
  List<Data> suggestions = [];
  bool isLoading = false;
  Timer? _debounce;
  double? lat;
  double? lon;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initApp();
    });
  }

  Future<void> initApp() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    final status = prefs.getString('currentLocation'); // agree or disagree
    final city = prefs.getString('city');

    if ((status == null || status == 'disagree') && city == null) {
      await useCurrentLocation(context);
    }
    if (!mounted) return;

    if (status == 'agree') {
      final pos = await determinePosition(context);
      final currentLocation = await SharedPreferences.getInstance();
      if (pos != null) {
        setState(() {
          lat = pos.latitude;
          lon = pos.longitude;
          currentLocation.setDouble('lat', pos.latitude);
          currentLocation.setDouble('lon', pos.longitude);
        });

        context.read<HomeBloc>().add(CurrentLocation(lat!, lon!));
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final pos = await determinePosition(context);

      if (pos != null && mounted) {
        context.read<HomeBloc>().add(
          CurrentLocation(pos.latitude, pos.longitude),
        );
        final currentWeather = await homeRepository.getWeatherCurrentLocation(
          pos.latitude,
          pos.longitude,
        );
        final lat = await SharedPreferences.getInstance();
        lat.setDouble('lat', pos.latitude);
        lat.setDouble('lon', pos.longitude);

        if (currentWeather is DataSuccess<CurrentWeatherEntity>) {
          final cityName = currentWeather.data.name;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('city', cityName);
          await prefs.setString('currentLocation', 'agree');
        } else if (currentWeather is DataFailed<CurrentWeatherEntity>) {
          debugPrint('Error getting city name: ${currentWeather.message}');
        }
        if (!mounted) return;

        if (ModalRoute.of(context)?.isCurrent ?? false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        }
      }
    }
  }

  void searchCity(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (value.isEmpty) {
        setState(() => suggestions = []);
        return;
      }

      setState(() => isLoading = true);
      final result = await homeRepository.getSuggestPlace(value);
      setState(() {
        suggestions = result;
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // back arrow
            GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                final status = prefs.getString('currentLocation');
                final city = prefs.getString('city');
                if ((status == 'disagree' || status == null) && city == null) {
                  SystemNavigator.pop();
                }
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                autofocus: true,
                cursorColor: Colors.yellowAccent,
                style: const TextStyle(color: Colors.white),
                onChanged: searchCity,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white60),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: GestureDetector(
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF454545),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8,
                ),
                child: InkWell(
                  onTap: () async {
                    final pos = await determinePosition(context);

                    if (pos != null && mounted) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('currentLocation', 'agree');

                      context.read<HomeBloc>().add(
                        CurrentLocation(pos.latitude, pos.longitude),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    }
                  },
                  child: Text(
                    'Add current location',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              if (isLoading)
                const CircularProgressIndicator(color: Colors.white),
              if (suggestions.isEmpty && isLoading == false)
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Text(
                      'No Suggestion!',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    final model = suggestions[index];
                    return ListTile(
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        model.name ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${model.region}, ${model.country}',
                        style: const TextStyle(color: Colors.white54),
                      ),
                      onTap: () async {
                        controller.text = model.name!;
                        final prefs = await SharedPreferences.getInstance();
                        final city = prefs.getString('city');
                        final cleanName = normalizeCity(model.name!);
                        if (city == null) {
                          final bloc = context.read<HomeBloc>();
                          bloc.add(SaveCityEvent(cleanName));
                          bloc.add(CityWeatherEvent());
                          bloc.add(CityForecastEvent());
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          Navigator.pop(context, cleanName);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
