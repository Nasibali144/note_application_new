import 'dart:html';

import '../pages/detail.dart';
import '../pages/home.dart';
import '../pages/sign_in.dart';
import '../pages/sign_up.dart';

class PageController {

  PageController();

  static void navigateTo(String pageUrl) {
    window.location.href = pageUrl;
  }

  static void loadPage() {
    String path = window.location.pathname!;
    print("Path: $path");

    switch (path) {
      case '/html/sign_up.html':
        SignUpPage();
        break;
      case '/html/sign_in.html':
        SignInPage();
        break;
      case '/html/home.html':
        Home();
        break;
      case '/html/detail.html':
        Detail();
        break;
      default:
        SignUpPage();
    }
  }
}

