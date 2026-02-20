import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';
import 'package:weather_app/features/home/presentation/util/formatter.dart';
import 'package:weather_app/features/home/presentation/widgets/skeleton/current_weather_skeleton.dart';
import 'package:weather_app/features/home/presentation/widgets/skeleton/forecast_weather_skeleton.dart';

class DailyWeatherBox extends StatefulWidget {
  const DailyWeatherBox({super.key});

  @override
  State<DailyWeatherBox> createState() => _DailyWeatherBoxState();
}

class _DailyWeatherBoxState extends State<DailyWeatherBox> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadCityWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  // loading
                  if (state.isLoadingCurrent) {
                    return const CurrentWeatherSkeleton();
                  }
                  // success
                  if (state.current != null) {
                    final CurrentWeatherEntity currentWeatherEntity =
                        state.current!;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 24,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              currentWeatherEntity.name,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              formatWeatherTime(
                                currentWeatherEntity.dt,
                                currentWeatherEntity.timezone,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(
                              'https://openweathermap.org/img/wn/${currentWeatherEntity.weather[0].icon.toString()}@2x.png',
                              width: 86,
                              height: 86,
                              errorBuilder: (context, error, stackTrace) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/weather.webp',
                                    width: 76,
                                    height: 76,
                                  ),
                                );
                              },
                            ),
                            Text(
                              '${currentWeatherEntity.main.temp.round().toString()}°',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  currentWeatherEntity.weather[0].main,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '${currentWeatherEntity.main.tempMax.round()}° / ${currentWeatherEntity.main.tempMin.round()}°',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'Feels like ${currentWeatherEntity.main.feelsLike.round()}°',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Text('ERROR');
                  }
                },
              ),

              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  // loading
                  if (state.isLoadingForecast) {
                    return const ForecastWeatherSkeleton();
                  }
                  // success
                  if (state.forecast != null) {
                    final ForecastWeatherEntity forecastWeatherEntity =
                        state.forecast!;
                    return SizedBox(
                      height: 110,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final weather =
                              forecastWeatherEntity.list[index].weather;
                          final icon = weather.isNotEmpty
                              ? weather[0].icon
                              : '01d';
                          return Column(
                            children: [
                              Text(
                                formattedTime(
                                  forecastWeatherEntity.list[index].dt,
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),

                              Image.network(
                                'https://openweathermap.org/img/wn/$icon@2x.png',
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/icons/weather.webp',
                                    width: 40,
                                    height: 40,
                                  );
                                },
                              ),

                              Text(
                                '${forecastWeatherEntity.list[index].main.temp.round().toString()}°',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/drop.png',
                                    height: 12,
                                    width: 12,
                                  ),
                                  Text(
                                    '${forecastWeatherEntity.list[index].main.humidity}%',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 24),
                        itemCount: forecastWeatherEntity.list.length,
                      ),
                    );
                  } else {
                    return Text('ERROR');
                  }
                },
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF303030),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('More', style: TextStyle(color: Colors.white70)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formattedTime(int dt) {
    final date = DateTime.fromMillisecondsSinceEpoch(
      dt * 1000,
      isUtc: true,
    ).toLocal();
    return DateFormat('HH:mm').format(date);
  }
}
