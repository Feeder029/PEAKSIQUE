final String profileTable = 'profile';

class ProfileFields {
  static final String pId = 'p_id';
  static final String accId = 'acc_id';
  static final String name = 'name';
  static final String image = 'image';
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
      'p_id': pId,
      'acc_id': accId,
      'name': name,
      'image': image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      pId: map['p_id'],
      accId: map['acc_id'],
      name: map['name'],
      image: map['image'],
    );
  }
}