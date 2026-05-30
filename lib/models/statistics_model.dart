final String statisticsTable = 'statistics';

class StatisticsFields {
  static final String statId = 'stat_id';
  static final String pId = 'p_id';
  static final String workouts = 'workouts';
  static final String lifted = 'lifted';
  static final String streak = 'streak';
}

class StatisticsModel {
  final int? statId;
  final int pId;
  final int workouts;
  final int lifted;
  final int streak;

  StatisticsModel({
    this.statId,
    required this.pId,
    required this.workouts,
    required this.lifted,
    required this.streak,
  });

  Map<String, dynamic> toMap() {
    return {
      'statId': statId,
      'pId': pId,
      'workouts': workouts,
      'lifted': lifted,
      'streak': streak,
    };
  }

  factory StatisticsModel.fromMap(Map<String, dynamic> map) {
    return StatisticsModel(
      statId: map['stat_id'],
      pId: map['p_id'], 
      workouts: map['workouts'], 
      lifted: map['lifted'], 
      streak: map['streak'],
    );
  }
}