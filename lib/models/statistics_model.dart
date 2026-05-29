class Profile {
  final int? pId;
  final int actId;
  final String name;
  final  String image;

  Profile({
    this.pId,
    required this.actId,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'pId': pId,
      'actId': actId,
      'name': name,
      'image': image,
    };
  }

  
}