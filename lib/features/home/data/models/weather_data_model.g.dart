// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDataModelAdapter extends TypeAdapter<WeatherDataModel> {
  @override
  final int typeId = 50;

  @override
  WeatherDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDataModel(
      current: fields[0] as CurrentWeatherModel?,
      forecast: fields[1] as ForecastWeatherModel?,
      isFavourite: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.forecast)
      ..writeByte(2)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
