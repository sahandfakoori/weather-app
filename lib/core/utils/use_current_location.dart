import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> useCurrentLocation(BuildContext context) async {
  final SharedPreferences currentLocation =
      await SharedPreferences.getInstance();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Color(0xff454545),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Handle بالا
            Container(
              width: 50,
              height: 5,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Title
            Text(
              'Use current location',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 16),

            // متن اسکرول‌دار
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  'Your current location will be collected and used to provide some of the Weather app features, such as getting your local weather. Other apps and services on your device may access the retrieved weather data to show the weather in those apps. In order to provide you with continued weather information, this app will regulary process your location, even when you are not using the app. By pressing Agree, you are agreeing to the collection and processing of your location for the above purposes. You can turn off using your location by going into the Weahter app settings.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // دکمه‌ها
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.amber),
                    ),
                    onPressed: () async {
                      await currentLocation.setString(
                          'currentLocation', 'disagree');

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Disagree',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      await currentLocation.setString(
                          'currentLocation', 'agree');

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Agree',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
          ],
        ),
      );
    },
  );











  // await showDialog(
  //   context: context,
  //   builder: (context) {
  //     return AlertDialog(
  //       title: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 12.0),
  //         child: Text('Use current location',style: TextStyle(
  //           fontSize: 26,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),),
  //       ),
  //       backgroundColor: Color(0xff454545),
  //       content: Text(
  //         'Your current location will be collected and used to provide some of the Weather app features, such as getting your local weather. Other apps and services on your device may access the retrieved weather data to show the weather in those apps. In order to provide you with continued weather information, this app will regulary process your location, even when you are not using the app. By pressing Agree, you are agreeing to the collection and processing of your location for the above purposes. You can turn off using your location by going into the Weahter app settings.',
  //         maxLines: 14,
  //         textAlign: TextAlign.justify,
  //         style: TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () async {
  //             await currentLocation.setString('currentLocation', 'disagree');
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             'Disagree',
  //             style: TextStyle(
  //               color: Colors.amber,
  //               fontWeight: FontWeight.w600,
  //               fontSize: 16,
  //             ),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: () async {
  //             await currentLocation.setString('currentLocation', 'agree');
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             'Agree',
  //             style: TextStyle(
  //               color: Colors.amber,
  //               fontWeight: FontWeight.w600,
  //               fontSize: 16,
  //             ),
  //           ),
  //         ),
  //       ],
  //     );
  //   },
  // );
}
