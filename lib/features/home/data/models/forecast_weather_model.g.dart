// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastWeatherModelAdapter extends TypeAdapter<ForecastWeatherModel> {
  @override
  final int typeId = 20;

  @override
  ForecastWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastWeatherModel(
      cod: fields[0] as int,
      message: fields[1] as int,
      cnt: fields[2] as int,
      list: (fields[3] as List).cast<ForecastItemModel>(),
      city: fields[4] as CityModel,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastWeatherModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cod)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.cnt)
      ..writeByte(3)
      ..write(obj.list)
      ..writeByte(4)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
