import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/utils/location_service.dart';
import 'package:weather_app/core/utils/use_current_location.dart';
import 'package:weather_app/features/home/presentation/pages/search_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initApp();
    });
  }

  Future<void> initApp() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    final status = prefs.getString('currentLocation');

    if (status == null || status == 'disagree') {
      await useCurrentLocation(context);
    }
    if (!mounted) return;

    if (status == 'agree') {
      await determinePosition(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return SearchScreen();
  }
}
