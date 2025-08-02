class UserModel {
  final String name;
  final int donation;

  UserModel({required this.name, required this.donation});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      donation: json['donation'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'name': name,
      'donation': donation,
    };
  }
}
