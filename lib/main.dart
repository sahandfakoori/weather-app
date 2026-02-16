import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/pages/home_screen.dart';
import 'package:weather_app/features/home/presentation/pages/landing_page.dart';
import 'package:weather_app/features/home/presentation/pages/search_screen.dart';
import 'package:weather_app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getitInitial();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider<HomeBloc>(
          create: (_) => locator<HomeBloc>(),
          child: SearchScreen(),
      ),
    );
  }
}
