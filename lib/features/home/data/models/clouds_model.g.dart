// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clouds_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CloudsModelAdapter extends TypeAdapter<CloudsModel> {
  @override
  final int typeId = 6;

  @override
  CloudsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CloudsModel(
      all: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CloudsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
