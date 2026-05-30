final String activityTable = 'activity';

class ActivityFields {
  static final String actId = 'act_id';
  static final String wId = 'w_id';
  static final String name = 'name';
  static final String status = 'status';
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
      'act_id': actId,
      'wrk_id': wId,
      'name': name,
      'status': status,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      actId: map['act_id'],
      wId: map['wrk_id'],
      name: map['name'],
      status: map['status'],
    );
  }
}