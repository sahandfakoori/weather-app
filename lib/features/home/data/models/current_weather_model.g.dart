// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentWeatherModelAdapter extends TypeAdapter<CurrentWeatherModel> {
  @override
  final int typeId = 0;

  @override
  CurrentWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentWeatherModel(
      coord: fields[0] as CoordModel,
      weather: (fields[1] as List).cast<WeatherModel>(),
      base: fields[2] as String,
      main: fields[3] as MainModel,
      visibility: fields[4] as int,
      wind: fields[5] as WindModel,
      rain: fields[6] as RainModel?,
      clouds: fields[7] as CloudsModel,
      dt: fields[8] as int,
      sys: fields[9] as CurrentSysModel,
      timezone: fields[10] as int,
      id: fields[11] as int,
      name: fields[12] as String,
      cod: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentWeatherModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.coord)
      ..writeByte(1)
      ..write(obj.weather)
      ..writeByte(2)
      ..write(obj.base)
      ..writeByte(3)
      ..write(obj.main)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.wind)
      ..writeByte(6)
      ..write(obj.rain)
      ..writeByte(7)
      ..write(obj.clouds)
      ..writeByte(8)
      ..write(obj.dt)
      ..writeByte(9)
      ..write(obj.sys)
      ..writeByte(10)
      ..write(obj.timezone)
      ..writeByte(11)
      ..write(obj.id)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.cod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
