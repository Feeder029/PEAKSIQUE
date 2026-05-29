class Account {
  final int? accId;
  final String email;
  final String password;

  Account({
    this.accId,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'accId': accId,
      'email': email,
      'password': password,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
   return Account(
    accId: map['accId'],
    email: map['email'],
    password: map['password'],
   ); 
  }
}