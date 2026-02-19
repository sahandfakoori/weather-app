// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastItemModelAdapter extends TypeAdapter<ForecastItemModel> {
  @override
  final int typeId = 21;

  @override
  ForecastItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastItemModel(
      dt: fields[0] as int,
      main: fields[1] as MainModel,
      weather: (fields[2] as List).cast<WeatherModel>(),
      clouds: fields[3] as CloudsModel,
      wind: fields[4] as WindModel,
      visibility: fields[5] as int?,
      pop: fields[6] as double?,
      rain: fields[7] as RainModel?,
      sys: fields[8] as ForecastSysModel,
      dtTxt: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastItemModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.clouds)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(6)
      ..write(obj.pop)
      ..writeByte(7)
      ..write(obj.rain)
      ..writeByte(8)
      ..write(obj.sys)
      ..writeByte(9)
      ..write(obj.dtTxt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
