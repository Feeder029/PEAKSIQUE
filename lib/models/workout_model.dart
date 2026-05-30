final String workoutTable = 'workout';

class WorkoutFields {
  static final String wId = 'w_id';
  static final String pId = 'p_id';
  static final String name = 'name';
  static final String date = 'date';
  static final String status = 'status';
}

class WorkoutModel {
  final int? wId;
  final int pId;
  final String name;
  final DateTime date;
  final String status;

  WorkoutModel({
    this.wId,
    required this.pId,
    required this.name,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'w_id': wId,
      'p_id': pId,
      'name': name,
      'date': date,
      'status': status,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      wId: map['w_id'],
      pId: map['p_id'],
      name: map['name'],
      date: map['date'],
      status: map['status'],
    );
  }
}