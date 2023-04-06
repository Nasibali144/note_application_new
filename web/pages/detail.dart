import 'dart:html';
import '../models/note_model.dart';
import '../services/auth_controller.dart';
import '../services/base_screen.dart';
import '../services/page_controller.dart';
import '../views/view.dart';

class Detail extends BaseScreen {
  @override
  void build() {

    print("Detail");
    final navbar = View.navbar("Detail");

    final form = View.form();

    final titleLabel = View.label("Title");
    final titleInput = View.input("Title");
    final contentLabel = View.label("Content");
    final submitButton = View.button("Save");
    final contentInput = View.textArea("Content");

    form.children = [
      titleLabel,
      titleInput,
      contentLabel,
      contentInput,
      submitButton
    ];

    submitButton.onClick.listen((event) async {
      String title = titleInput.value!;
      String content = contentInput.value!;
    });
    document.body!.children.addAll([navbar, form]);
  }
}
