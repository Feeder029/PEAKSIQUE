final String setsTable = 'sets';

class SetsFields {
  static final String setId = 'set_id';
  static final String actId = 'act_id';
  static final String set = 'set';
  static final String rep = 'rep';
  static final String rest = 'rest';
  static final String status = 'status';
}

class SetsModel {
  final int? setId;
  final int actId;
  final int set;
  final int rep;
  final int rest;
  final String status;

  SetsModel({
    this.setId,
    required this.actId,
    required this.set,
    required this.rep,
    required this.rest,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'set_id': setId,
      'act_id': actId,
      'set': set,
      'rep': rep,
      'rest': rest,
      'status': status,
    };
  }

  factory SetsModel.fromMap(Map<String, dynamic> map) {
    return SetsModel(
      setId: map['set_id'],
      actId: map['act_id'],
      set: map['set'],
      rep: map['rep'],
      rest: map['rest'],
      status: map['status'],
    );
  }
}