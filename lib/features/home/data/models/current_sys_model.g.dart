// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_sys_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentSysModelAdapter extends TypeAdapter<CurrentSysModel> {
  @override
  final int typeId = 7;

  @override
  CurrentSysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentSysModel(
      type: fields[0] as int?,
      id: fields[1] as int?,
      country: fields[2] as String,
      sunrise: fields[3] as int,
      sunset: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentSysModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.sunrise)
      ..writeByte(4)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentSysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
