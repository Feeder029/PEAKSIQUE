class ProfileModel {
  final int? pId;
  final int actId;
  final String name;
  final  String image;

  ProfileModel({
    this.pId,
    required this.actId,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'p_id': pId,
      'act_id': actId,
      'name': name,
      'image': image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      pId: map['p_id'],
      actId: map['act_id'],
      name: map['name'],
      image: map['image'],
    );
  }
}