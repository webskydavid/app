// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParametersModelAdapter extends TypeAdapter<ParametersModel> {
  @override
  final int typeId = 3;

  @override
  ParametersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParametersModel(
      bodyParts: fields[0] as String,
      actionType: fields[1] as String,
      weight: fields[2] as int,
      reps: fields[3] as int,
      time: fields[4] as int,
      solidTime: fields[5] as bool,
      intensity: fields[6] as int,
      inSet: fields[7] as int,
      note: (fields[8] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ParametersModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.bodyParts)
      ..writeByte(1)
      ..write(obj.actionType)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.reps)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.solidTime)
      ..writeByte(6)
      ..write(obj.intensity)
      ..writeByte(7)
      ..write(obj.inSet)
      ..writeByte(8)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParametersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
