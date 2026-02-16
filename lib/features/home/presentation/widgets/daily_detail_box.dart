import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';
import 'package:weather_app/features/home/presentation/util/formatter.dart';
import 'package:weather_app/features/home/presentation/widgets/skeleton/detail_weather_skeleton.dart';

class DailyDetailBox extends StatelessWidget {
  const DailyDetailBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // loading
          if (state.isLoadingCurrent) {
            return const DetailWeatherSkeleton();
          }

          // success
          if (state.current != null) {
            final CurrentWeatherEntity currentWeatherEntity =
            state.current!;
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/sunrise.png',
                        height: 36,
                        width: 36,
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Sunrise',
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        formatWeatherTime(
                          currentWeatherEntity.sys.sunrise,
                          currentWeatherEntity.timezone,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.5,indent: 20,endIndent: 20,height: 40,),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/sunset.png',
                        height: 36,
                        width: 36,
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Sunset',
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        formatWeatherTime(
                          currentWeatherEntity.sys.sunset,
                          currentWeatherEntity.timezone,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.5,indent: 20,endIndent: 20,height: 40,),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/wind.png',
                        height: 36,
                        width: 36,
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${currentWeatherEntity.wind.speed.toString()} km/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.5,indent: 20,endIndent: 20,height: 40,),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/humidity.png',
                        height: 36,
                        width: 36,
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Humidity',
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${currentWeatherEntity.main.humidity} %',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 140,),
                ],
              ),
            );
          } else {
            return Text('Error');
          }
        },
      ),
    );
  }
}
