// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RainModelAdapter extends TypeAdapter<RainModel> {
  @override
  final int typeId = 5;

  @override
  RainModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RainModel(
      h1: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, RainModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.h1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RainModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
