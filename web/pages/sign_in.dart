import 'dart:html';
import '../services/auth_controller.dart';
import '../services/base_screen.dart';
import '../services/page_controller.dart';
import '../views/view.dart';

class SignInPage extends BaseScreen {
  @override
  void build() {

    print("Sign In");
    final navbar = View.navbar("Sign In");

    final form = View.form();

    final emailLabel = View.label("Email");
    final emailInput = View.input("email");
    final passwordLabel = View.label("Password");
    final passwordInput = View.input("password");
    final submitButton = View.button("Sign In");

    form.children = [
      emailLabel,
      emailInput,
      passwordLabel,
      passwordInput,
      submitButton
    ];

    submitButton.onClick.listen((event) async {
      String email = emailInput.value!;
      String password = passwordInput.value!;

      AuthController.signIn(email, password).then((result) {
        PageController.navigateTo("home.html");
      });
    });
    document.body!.children.addAll([navbar, form]);
  }
}
