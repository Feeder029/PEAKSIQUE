final String workoutTable = 'workout';

class WorkoutFields {
  static const List<String> values = [
    wId, pId, name, date, status
  ];

  static const String wId = 'w_id';
  static const String pId = 'p_id';
  static const String name = 'name';
  static const String date = 'date';
  static const String status = 'status';
}

class WorkoutModel {
  final int? wId;
  final int pId;
  final String name;
  final String date;
  final String status;

  WorkoutModel({
    this.wId,
    required this.pId,
    required this.name,
    required this.date,
    required this.status,
  });

  WorkoutModel copy({
    int? wId,
    int? pId,
    String? name,
    String? date,
    String? status,
  }) =>
    WorkoutModel(
      wId: wId ?? this.wId,
      pId: pId ?? this.pId,
      name: name ?? this.name,
      date: date ?? this.date,
      status: status ?? this.status
    );

  Map<String, dynamic> toMap() {
    return {
      WorkoutFields.wId: wId,
      WorkoutFields.pId: pId,
      WorkoutFields.name: name,
      WorkoutFields.date: date,
      WorkoutFields.status: status
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      wId: map[WorkoutFields.wId] as int,
      pId: map[WorkoutFields.pId] as int ,
      name: map[WorkoutFields.name] as String,
      date: map[WorkoutFields.date] as String,
      status: map[WorkoutFields.status] as String,
    );
  }
}