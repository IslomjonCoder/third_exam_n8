// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketItemAdapter extends TypeAdapter<BasketItem> {
  @override
  final int typeId = 2;

  @override
  BasketItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketItem(
      product: fields[0] as ProductModel,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BasketItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
