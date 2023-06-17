// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscountEntityAdapter extends TypeAdapter<DiscountEntity> {
  @override
  final int typeId = 0;

  @override
  DiscountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscountEntity(
      id: fields[0] as int,
      mod: fields[1] as int,
      viewed: fields[2] as int,
      img: fields[3] as String,
      createdAt: fields[4] as DateTime,
      title: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DiscountEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mod)
      ..writeByte(2)
      ..write(obj.viewed)
      ..writeByte(3)
      ..write(obj.img)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
