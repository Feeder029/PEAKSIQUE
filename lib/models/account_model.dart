final String accountTable = 'account';

class AccountFields {
  static const List<String> values = [
    accId, email, password,
  ];

  static const String accId = 'acc_id';
  static const String email = 'email';
  static const String password = 'password';
}

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
      AccountFields.accId: accId,
      AccountFields.email: email,
      AccountFields.password: password,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
   return AccountModel(
    accId: map[AccountFields.accId] as int?,
    email: map[AccountFields.email] as String,
    password: map[AccountFields.password] as String,
   ); 
  }
}