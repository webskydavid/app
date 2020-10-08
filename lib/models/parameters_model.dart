import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class Parameters {
  @HiveField(0)
  String bodyParts;
  @HiveField(1)
  String actionType;
  @HiveField(2)
  int weight;
  @HiveField(3)
  int reps;
  @HiveField(4)
  int time;
  @HiveField(5)
  bool solidTime;
  @HiveField(6)
  int intensity;
  @HiveField(7)
  int inSet;
  @HiveField(8)
  List<String> note;

  Parameters({
    this.bodyParts,
    @required this.actionType,
    this.weight,
    this.reps,
    this.time,
    this.solidTime,
    this.intensity,
    this.inSet,
    this.note,
  });
}
