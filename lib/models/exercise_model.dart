import 'package:hive/hive.dart';
import 'models.dart';

@HiveType(typeId: 1)
class BaseExerciseModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String date;
  @HiveField(2)
  String time;
  @HiveField(3)
  String name;
  @HiveField(4)
  String type;
  @HiveField(5)
  int group;
  @HiveField(6)
  Parameters parameters;

  BaseExerciseModel({
    this.id,
    this.date,
    this.time,
    this.name,
    this.type,
    this.group,
    this.parameters,
  });
}
