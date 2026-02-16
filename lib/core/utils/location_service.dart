import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position?> determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    final result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return Dialog(
          backgroundColor: const Color(0xff505050),
          insetPadding: const EdgeInsets.all(16),
          child: SizedBox(
            width: size.width * 0.84,
            // height: size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      'To continue, your device will need to use Location Accuracy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: .w500,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'The following settings should be on:',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 24,
                          color: Color(0xff0c77fd),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Device location',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.my_location,
                          size: 24,
                          color: Color(0xff0c77fd),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Location Accuracy, which provides more accurate location for apps and services. To do this, Google periodically processes information about device sensors and wireless signals from your device to crowdsource wirelesssignal locations. These are used without identifying you to improve location accuracy and location-based services and to improve, provide and maintain Google\'s services based on Google\'s and third parties\' legitimate interests to serve users\' needs.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'You can change this at any time in location settings.',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context, true);
                            Geolocator.openLocationSettings();
                          },
                          child: Text(
                            'Open Setting',
                            style: TextStyle(color: Color(0xff6a84fb)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            'No, thanks',
                            style: TextStyle(color: Color(0xff6a84fb)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    if (result == false || result == null) {
      return null;
    }
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
