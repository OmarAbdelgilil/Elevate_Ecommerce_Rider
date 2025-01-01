// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheUserModelAdapter extends TypeAdapter<CacheUserModel> {
  @override
  final int typeId = 0;

  @override
  CacheUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheUserModel(
      id: fields[0] as String,
      country: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      vehicleType: fields[4] as String,
      vehicleNumber: fields[5] as String,
      vehicleLicense: fields[6] as String,
      nid: fields[7] as String,
      nidImg: fields[8] as String,
      email: fields[9] as String,
      gender: fields[10] as String,
      phone: fields[11] as String,
      photo: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CacheUserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.vehicleType)
      ..writeByte(5)
      ..write(obj.vehicleNumber)
      ..writeByte(6)
      ..write(obj.vehicleLicense)
      ..writeByte(7)
      ..write(obj.nid)
      ..writeByte(8)
      ..write(obj.nidImg)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.gender)
      ..writeByte(11)
      ..write(obj.phone)
      ..writeByte(12)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
