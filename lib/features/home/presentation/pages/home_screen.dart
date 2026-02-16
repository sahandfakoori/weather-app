import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/utils/location_service.dart';
import 'package:weather_app/core/utils/use_current_location.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/widgets/app_bar_sliver.dart';
import 'package:weather_app/features/home/presentation/widgets/daily_detail_box.dart';
import 'package:weather_app/features/home/presentation/widgets/daily_weather_box.dart';
import 'package:weather_app/features/home/presentation/widgets/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  late String cityName = 'Tehran';
  String city = 'Loading...';

  @override
  void initState() {
    super.initState();

    initApp();


  }


  Future<void> initApp() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    final status = prefs.getString('currentLocation');

    if(status == null || status == 'disagree') {
      await useCurrentLocation(context);
    }
    if (!mounted) return;

    if(status == 'agree') {
      await determinePosition(context);
    }
  }















  // Future<void> checkLocationSetting() async {
  //   try {
  //
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String? city = prefs.getString('city');
  //     if (city == null) {
  //       Position pos = await determinePosition(context);
  //     } else {
  //       context.read<HomeBloc>().add(CityWeatherEvent());
  //       context.read<HomeBloc>().add(CityForecastEvent());
  //     }
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (_) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text(e.toString()),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //               Geolocator.openLocationSettings();
  //             },
  //             child: Text('Setting'),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               final String selectedCity = await Navigator.push(
  //                 context,
  //                 PageRouteBuilder(
  //                   pageBuilder: (context, animation, secondaryAnimation) =>
  //                       SearchScreen(),
  //                   transitionsBuilder:
  //                       (context, animation, secondaryAnimation, child) {
  //                         var begin = Offset(1.0, 0.0);
  //                         var end = Offset.zero;
  //                         var curve = Curves.ease;
  //                         var tween = Tween(
  //                           begin: begin,
  //                           end: end,
  //                         ).chain(CurveTween(curve: curve));
  //                         return SlideTransition(
  //                           position: animation.drive(tween),
  //                           child: child,
  //                         );
  //                       },
  //                 ),
  //               );
  //               context.read<HomeBloc>().add(SaveCityEvent(selectedCity));
  //
  //               if (selectedCity.isNotEmpty) {
  //                 Navigator.pop(context);
  //               }
  //
  //               context.read<HomeBloc>().add(CityWeatherEvent());
  //               context.read<HomeBloc>().add(CityForecastEvent());
  //             },
  //             child: Text('Select city'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  Future<void> _loadCity() async {
    final prefs = await SharedPreferences.getInstance();
    final storedCity = prefs.getString('city') ?? 'Qazvin';
    setState(() {
      city = storedCity;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(CityWeatherEvent());
          context.read<HomeBloc>().add(CityForecastEvent());
        },
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            AppBarSliver(controller: _controller, cityName: city),
            DailyWeatherBox(),
            DailyDetailBox(),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
