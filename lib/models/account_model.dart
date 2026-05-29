class AccountModel {
  final int? accId;
  final String email;
  final String password;

  AccountModel({
    this.accId,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'acc_id': accId,
      'email': email,
      'password': password,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
   return AccountModel(
    accId: map['ac_id'],
    email: map['email'],
    password: map['password'],
   ); 
  }
}