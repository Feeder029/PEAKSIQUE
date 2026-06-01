final String activityTable = 'activity';

class ActivityFields {
  static const List<String> values = [
    actId, wId, name, status
  ];

  static const String actId = 'act_id';
  static const String wId = 'w_id';
  static const String name = 'name';
  static const String status = 'status';
}

class ActivityModel {
  final int? actId;
  final int wId;
  final String name;
  final String status;

  ActivityModel({
    this.actId,
    required this.wId,
    required this.name,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      ActivityFields.actId: actId,
      ActivityFields.wId: wId,
      ActivityFields.name: name,
      ActivityFields.status: status,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      actId: map[ActivityFields.actId] as int?,
      wId: map[ActivityFields.wId] as int,
      name: map[ActivityFields.name] as String,
      status: map[ActivityFields.status] as String,
    );
  }
}