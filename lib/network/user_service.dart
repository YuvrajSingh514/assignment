
import 'package:assignment/network/user_model.dart';

class UserService {
  Future<List<UserModel>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 1));

    final List<Map<String, dynamic>> jsonData = [
      {"name": "Yuvraj Singh", "donation": 5000},
      {"name": "Abhishek Yadav", "donation": 2000},
      {"name": "Sam", "donation": 800},
      {"name": "Tom", "donation": 1000},
      {"name": "Devangere", "donation": 8000},
      {"name": "Chris", "donation": 9000},
    ];
    return jsonData.map((json)=> UserModel.fromJson(json)).toList();
  }
}
