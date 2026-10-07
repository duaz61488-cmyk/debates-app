class UserModel {
  final String id;
  final String username;
  final String profileImageUrl;
  final int age;
  final String bio;
  final int totalDebates;
  final int wins;

  UserModel({
    required this.id,
    required this.username,
    required this.profileImageUrl,
    required this.age,
    required this.bio,
    this.totalDebates = 0,
    this.wins = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'profileImageUrl': profileImageUrl,
      'age': age,
      'bio': bio,
      'totalDebates': totalDebates,
      'wins': wins,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      age: json['age'] ?? 18,
      bio: json['bio'] ?? '',
      totalDebates: json['totalDebates'] ?? 0,
      wins: json['wins'] ?? 0,
    );
  }
}
