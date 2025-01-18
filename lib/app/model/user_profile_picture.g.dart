// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_picture.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfilePictureAdapter extends TypeAdapter<UserProfilePicture> {
  @override
  final int typeId = 5;

  @override
  UserProfilePicture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfilePicture(
      bg: fields[0] as String?,
      md: fields[1] as String?,
      sm: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfilePicture obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bg)
      ..writeByte(1)
      ..write(obj.md)
      ..writeByte(2)
      ..write(obj.sm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfilePictureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
