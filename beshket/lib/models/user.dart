class User {
  final String name;
  final String email;
  final int age;
  final String imageUrl;

  String get getName => name;
  String get getEmail => email;
  int get getAge => age;

  User({
    required this.name,
    required this.email,
    required this.age,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
