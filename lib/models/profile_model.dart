final String profileTable = 'profile';

class ProfileFields {
  static const List<String> values = [
    pId, accId, name, image
  ];
  static const String pId = 'p_id';
  static const String accId = 'acc_id';
  static const String name = 'name';
  static const String image = 'image';
}

class ProfileModel {
  final int? pId;
  final int accId;
  final String name;
  final  String image;

  ProfileModel({
    this.pId,
    required this.accId,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      ProfileFields.pId: pId,
      ProfileFields.accId: accId,
      ProfileFields.name: name,
      ProfileFields.image: image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      pId: map[ProfileFields.pId] as int?,
      accId: map[ProfileFields.accId] as int,
      name: map[ProfileFields.name] as String,
      image: map[ProfileFields.image] as String,
    );
  }
}