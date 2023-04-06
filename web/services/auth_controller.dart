import 'dart:convert';
import 'dart:html';
import '../models/user_model.dart';
import 'network_controller.dart';

class AuthController {
  AuthController._();
  
  static Future<User?> signUp(String fullname, String email, String password) async {
    if(fullname.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      User user = User(DateTime.now().millisecondsSinceEpoch, fullname, "", email, password, "0");
      final http = Network();
      return http.post(Api.baseUrl, Api.users.path, user.toJson()).then((response) {
        window.localStorage["user"] = response;
        return http.parseOneUser(response);
      });
    }
    
    return null;
  }

  static Future<bool> signIn(String email, String password) async {
    if(email.isNotEmpty && password.isNotEmpty) {
      final http = Network();
      String response = await http.get(Api.baseUrl, Api.users.path);
      List<User> users = http.parseAllUser(response);
      try {
        // window.localStorage["user"] = jsonEncode(users.firstWhere((element) => element.email == email && element.password == password).toJson());
        return users.any((element) => element.email == email && element.password == password);
      } catch(e) {
        return false;
      }
    }

    return false;
  }
}