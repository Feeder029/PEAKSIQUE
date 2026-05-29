class Workout {
  final int? wId;
  final int pId;
  final String name;
  final String date;
  final String status;

  Workout({
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

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      wId: map['wrk_id'],
      pId: map['p_id'],
      name: map['name'],
      date: map['date'],
      status: map['status'],
    );
  }
}