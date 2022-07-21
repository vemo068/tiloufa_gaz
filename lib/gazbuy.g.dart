// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gazbuy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GazbuyAdapter extends TypeAdapter<Gazbuy> {
  @override
  final int typeId = 22;

  @override
  Gazbuy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gazbuy(
      date: fields[1] as DateTime,
      payed: fields[2] as int,
      recived: fields[4] as int,
      ruterned: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Gazbuy obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.payed)
      ..writeByte(3)
      ..write(obj.ruterned)
      ..writeByte(4)
      ..write(obj.recived);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GazbuyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
