class SetsModel {
  final int? setId;
  final int actId;
  final int set;
  final int reps;
  final int rest;
  final String status;

  SetsModel({
    this.setId,
    required this.actId,
    required this.set,
    required this.reps,
    required this.rest,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'set_id': setId,
      'act_id': actId,
      'set': set,
      'reps': reps,
      'rest': rest,
      'status': status,
    };
  }

  factory SetsModel.fromMap(Map<String, dynamic> map) {
    return SetsModel(
      setId: map['set_id'],
      actId: map['act_id'],
      set: map['set'],
      reps: map['reps'],
      rest: map['rest'],
      status: map['status'],
    );
  }
}