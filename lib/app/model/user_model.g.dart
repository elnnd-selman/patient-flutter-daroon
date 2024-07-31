// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      user: fields[0] as User?,
      token: fields[1] as String?,
      success: fields[2] as bool?,
      message: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.success)
      ..writeByte(3)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      name: fields[1] as String?,
      username: fields[2] as String?,
      fullName: fields[3] as String?,
      email: fields[4] as String?,
      isEmailVerified: fields[5] as bool?,
      level: fields[6] as String?,
      password: fields[7] as String?,
      isActive: fields[8] as bool?,
      gender: fields[9] as String?,
      phone: fields[10] as Phone?,
      bio: fields[11] as String?,
      education: (fields[12] as List).cast<Education>(),
      experienceByYear: fields[13] as int?,
      typeOfUser: fields[14] as String?,
      listOfAssistants: (fields[15] as List).cast<dynamic>(),
      language: fields[16] as String?,
      createdAt: fields[17] as DateTime?,
      updatedAt: fields[18] as DateTime?,
      v: fields[19] as int?,
      sessionToken: fields[20] as String?,
      profilePicture: fields[21] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.isEmailVerified)
      ..writeByte(6)
      ..write(obj.level)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.isActive)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.bio)
      ..writeByte(12)
      ..write(obj.education)
      ..writeByte(13)
      ..write(obj.experienceByYear)
      ..writeByte(14)
      ..write(obj.typeOfUser)
      ..writeByte(15)
      ..write(obj.listOfAssistants)
      ..writeByte(16)
      ..write(obj.language)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.updatedAt)
      ..writeByte(19)
      ..write(obj.v)
      ..writeByte(20)
      ..write(obj.sessionToken)
      ..writeByte(21)
      ..write(obj.profilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EducationAdapter extends TypeAdapter<Education> {
  @override
  final int typeId = 3;

  @override
  Education read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Education(
      degree: fields[0] as String?,
      fromYear: fields[1] as String?,
      toYear: fields[2] as String?,
      institute: fields[3] as String?,
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Education obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.degree)
      ..writeByte(1)
      ..write(obj.fromYear)
      ..writeByte(2)
      ..write(obj.toYear)
      ..writeByte(3)
      ..write(obj.institute)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EducationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhoneAdapter extends TypeAdapter<Phone> {
  @override
  final int typeId = 4;

  @override
  Phone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phone(
      number: fields[0] as String?,
      isVerified: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Phone obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.isVerified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
