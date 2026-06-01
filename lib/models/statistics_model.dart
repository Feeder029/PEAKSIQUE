final String statisticsTable = 'statistics';

class StatisticsFields {
  static const List<String> values = [
    statId, pId, workouts, lifted, streak
  ];
  static const String statId = 'stat_id';
  static const String pId = 'p_id';
  static const String workouts = 'workouts';
  static const String lifted = 'lifted';
  static const String streak = 'streak';
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
      StatisticsFields.statId: statId,
      StatisticsFields.pId: pId,
      StatisticsFields.workouts: workouts,
      StatisticsFields.lifted: lifted,
      StatisticsFields.streak: streak,
    };
  }

  factory StatisticsModel.fromMap(Map<String, dynamic> map) {
    return StatisticsModel(
      statId: map[StatisticsFields.statId] as int?,
      pId: map[StatisticsFields.pId] as int, 
      workouts: map[StatisticsFields.workouts] as int, 
      lifted: map[StatisticsFields.lifted] as int, 
      streak: map[StatisticsFields.streak] as int,
    );
  }
}