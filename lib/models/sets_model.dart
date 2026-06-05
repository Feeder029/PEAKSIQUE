final String setsTable = 'setdata';

class SetsFields {
  static const List<String> values = [
    setId, actId, sets, reps, kg, rest, status
  ];
  static const String setId = 'set_id';
  static const String actId = 'act_id';
  static const String sets = 'sets';
  static const String reps = 'reps';
  static const String kg = 'kg';
  static const String rest = 'rest';
  static const String status = 'status';
}

class SetsModel {
  final int? setId;
  final int actId;
  final int sets;
  final int reps;
  final int kg;
  final int rest;
  final String status;

  SetsModel({
    this.setId,
    required this.actId,
    required this.sets,
    required this.reps,
    required this.kg,
    required this.rest,
    required this.status,
  });

  SetsModel copy({
    int? setId,
    int? actId,
    int? sets,
    int? reps,
    int? kg,
    int? rest,
    String? status,
  }) =>
    SetsModel(
      setId: setId ?? this.setId,
      actId: actId ?? this.actId,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      kg: kg ?? this.kg,
      rest: rest ?? this.rest,
      status: status ?? this.status
    );

  Map<String, dynamic> toMap() {
    return {
      SetsFields.setId: setId,
      SetsFields.actId: actId,
      SetsFields.sets: sets,
      SetsFields.reps: reps,
      SetsFields.kg: kg,
      SetsFields.rest: rest,
      SetsFields.status: status,
    };
  }

  factory SetsModel.fromMap(Map<String, dynamic> map) {
    return SetsModel(
      setId: map[SetsFields.setId] as int?,
      actId: map[SetsFields.actId] as int,
      sets: map[SetsFields.sets] as int,
      reps: map[SetsFields.reps] as int,
      kg: map[SetsFields.kg] as int,
      rest: map[SetsFields.rest] as int,
      status: map[SetsFields.status] as String,
    );
  }
}