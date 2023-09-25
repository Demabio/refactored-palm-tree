class Login {
  final int id;
  final String username;

  Login({required this.id, required this.username});

  factory Login.fromSqfliteDatabase(Map<String, dynamic> map) =>
      Login(id: map['id']?.toInt() ?? 0, username: map['username'] ?? '');
}
