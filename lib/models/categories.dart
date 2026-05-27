import 'package:flutter/material.dart';

class ExerciseModel {
  String name;

  ExerciseModel({
    required this.name
  });

  static List<ExerciseModel> getExercises() {
    List<ExerciseModel> exercises = [];

    exercises.add(
      ExerciseModel(name: 'Bench Press')
    );

    exercises.add(
      ExerciseModel(name: 'OHP')
    );

    exercises.add(
      ExerciseModel(name: 'Incline DB')
    );

    exercises.add(
      ExerciseModel(name: 'Lateral Raise')
    );

    return exercises;
  }
}