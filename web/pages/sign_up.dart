import 'dart:html';

import '../services/auth_controller.dart';
import '../services/base_screen.dart';
import '../services/page_controller.dart';
import '../views/view.dart';

class SignUpPage extends BaseScreen {
  @override
  void build() {
    final navbar = View.navbar("Sign Up");

    final form = View.form();

    final nameLabel = View.label("Fullname");
    final nameInput = View.input("fullname");
    final emailLabel = View.label("Email");
    final emailInput = View.input("email");
    final passwordLabel = View.label("Password");
    final passwordInput = View.input("password");
    final submitButton = View.button("Sign Up");

    form.children = [
      nameLabel,
      nameInput,
      emailLabel,
      emailInput,
      passwordLabel,
      passwordInput,
      submitButton
    ];

    submitButton.onClick.listen((event) async {
      String fullname = nameInput.value!;
      String email = emailInput.value!;
      String password = passwordInput.value!;

      AuthController.signUp(fullname, email, password).then((result) {
        if(result != null) {
          PageController.navigateTo("sign_in.html");
        } else {
          print("Registration failed: $fullname \t$email \t$password");
        }
      });
    });
    document.body!.children.addAll([navbar, form]);
  }
}
