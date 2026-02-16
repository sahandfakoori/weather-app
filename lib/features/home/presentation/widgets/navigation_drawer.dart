import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';
import 'package:weather_app/features/home/presentation/pages/manage_locations.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 44, left: 24, right: 24),
      color: Colors.black,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        spacing: 12,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.settings, color: Colors.white, size: 28)],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,
            children: [
              Icon(Icons.star, color: Colors.yellowAccent, size: 28),
              Text(
                'Favourate location',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Icon(Icons.info_outlined, color: Colors.grey, size: 28),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.current == null) {
                return const SizedBox();
              }
              final currentWeatherEntity = state.current!;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_off_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  Text(
                    '${currentWeatherEntity.name} County',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Image.network(
                    'http://openweathermap.org/img/wn/${currentWeatherEntity.weather[0].icon.toString()}@2x.png',
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    '${currentWeatherEntity.main.temp.round().toString()}°',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),

          Divider(thickness: 0.5, endIndent: 10, indent: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,
            children: [
              Icon(Icons.add_location, color: Colors.grey, size: 24),
              Text(
                'Other locations',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text('No more', style: TextStyle(fontSize: 14, color: Colors.white)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff515151)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ManageLocations(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Text(
                'Manage locations',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),

          Divider(thickness: 0.5, endIndent: 10, indent: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,
            children: [
              Icon(Icons.warning_outlined, color: Colors.white, size: 28),
              Text(
                'Report wrong location',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,

            children: [
              Icon(Icons.headset_mic_rounded, color: Colors.grey, size: 28),
              Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,

            children: [
              Icon(Icons.question_mark_rounded, color: Colors.grey, size: 28),
              Text(
                'How to use',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
