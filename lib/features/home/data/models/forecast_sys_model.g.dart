// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_sys_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastSysModelAdapter extends TypeAdapter<ForecastSysModel> {
  @override
  final int typeId = 10;

  @override
  ForecastSysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastSysModel(
      pod: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastSysModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastSysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
