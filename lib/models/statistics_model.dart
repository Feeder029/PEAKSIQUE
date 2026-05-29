class StatisticsModel {
  final int? statID;
  final int pId;
  final int workouts;
  final int lifted;
  final int streak;

  StatisticsModel({
    this.statID,
    required this.pId,
    required this.workouts,
    required this.lifted,
    required this.streak,
  });

  Map<String, dynamic> toMap() {
    return {
      'statId': statID,
      'pId': pId,
      'workouts': workouts,
      'lifted': lifted,
      'streak': streak,
    };
  }

  factory StatisticsModel.fromMap(Map<String, dynamic> map) {
    return StatisticsModel(
      statID: map['stat_id'],
      pId: map['p_id'], 
      workouts: map['workouts'], 
      lifted: map['lifted'], 
      streak: map['streak'],
    );
  }
}