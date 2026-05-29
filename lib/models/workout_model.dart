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

  Map<String, dynamic> toMap() {
    return {
      'wrk_id': wId,
      'p_id': pId,
      'name': name,
      'date': date,
      'status': status,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      wId: map['wrk_id'],
      pId: map['p_id'],
      name: map['name'],
      date: map['date'],
      status: map['status'],
    );
  }
}