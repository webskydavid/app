// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseExerciseModelAdapter extends TypeAdapter<BaseExerciseModel> {
  @override
  final int typeId = 1;

  @override
  BaseExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseExerciseModel(
      id: fields[0] as String,
      date: fields[1] as String,
      time: fields[2] as String,
      name: fields[3] as String,
      note: fields[4] as String,
      muscleGroup: (fields[5] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BaseExerciseModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.muscleGroup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
