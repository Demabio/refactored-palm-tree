class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromSqfliteDatabase(Map<String, dynamic> map) => User(
        id: map['id']?.toInt() ?? 0,
        username: map['username'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? '',
      );
}
