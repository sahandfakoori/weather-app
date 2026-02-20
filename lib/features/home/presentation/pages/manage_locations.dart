import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/features/home/data/models/weather_data_model.dart';

class ManageLocations extends StatefulWidget {
  const ManageLocations({super.key});

  @override
  State<ManageLocations> createState() => _ManageLocationsState();
}

class _ManageLocationsState extends State<ManageLocations> {
  late Box<WeatherDataModel> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<WeatherDataModel>('weather');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
        ),
        title: Text(
          'Manage Locations',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<WeatherDataModel> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                'هیچ شهری ذخیره نشده',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final cities = box.keys.toList();

          return ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];

              final data = box.get(city);

              return ListTile(
                title: Text(
                  city.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                // onTap: () async {
                //   final prefs = await SharedPreferences.getInstance();
                //   await prefs.setString('city', city.toString());
                //
                //   Navigator.pop(context);
                // },

                subtitle: data?.current != null
                    ? Text(
                  '${data!.current!.main.temp.round()}°',
                  style: const TextStyle(color: Colors.grey),
                )
                    : null,

                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteCity(city.toString());
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _deleteCity(String city) async {
    await box.delete(city);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$city حذف شد')),
    );
  }
}
