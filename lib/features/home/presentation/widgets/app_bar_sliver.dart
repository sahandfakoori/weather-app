import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/utils/location_service.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';
import 'package:weather_app/features/home/presentation/pages/home_screen.dart';
import 'package:weather_app/features/home/presentation/pages/search_screen.dart';

class AppBarSliver extends StatefulWidget {
  final ScrollController controller;

  const AppBarSliver({super.key, required this.controller});

  @override
  State<AppBarSliver> createState() => _AppBarSliverState();
}

class _AppBarSliverState extends State<AppBarSliver> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final cityName = state.current?.name ?? 'Weather';
        return SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () async {
                await determinePosition(context);
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
              icon: Icon(
                Icons.location_on_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () async {
                final bloc = context.read<HomeBloc>();
                final selectedCity = await Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SearchScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                  ),
                );
                bloc.add(SaveCityEvent(selectedCity));
                if (!mounted || selectedCity == null) return;
                bloc.add(CityWeatherEvent());
                bloc.add(CityForecastEvent());
              },
              icon: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ],
          title: AnimatedBuilder(
            animation: widget.controller,
            builder: (context, child) {
              final offset = widget.controller.hasClients
                  ? widget.controller.offset
                  : 0;
              const maxScroll = 200 - kToolbarHeight;
              final opacity = (offset / maxScroll).clamp(0.0, 1.0);
              return Opacity(
                opacity: opacity,
                child: Text(cityName, style: TextStyle(color: Colors.white)),
              );
            },
          ),
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final currentHeight = constraints.biggest.height;
              final minHeight =
                  kToolbarHeight + MediaQuery.of(context).padding.top;
              final percent = ((currentHeight - minHeight) / (200 - minHeight))
                  .clamp(0.0, 1.0);
              final blackOpacity = 1 - percent;
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/sky.jpg', fit: BoxFit.cover),
                  Container(
                    color: Colors.black.withValues(alpha: blackOpacity),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.transparent],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: percent,
                    child: const Center(
                      child: Text(
                        'Weather',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
