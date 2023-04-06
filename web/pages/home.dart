import 'dart:html';
import '../models/note_model.dart';
import '../services/base_screen.dart';
import '../services/network_controller.dart';
import '../views/view.dart';

class Home extends BaseScreen {
  @override
  void build() {
    final http = Network();
    List<Note> list = [];
    print("Welcome to Home");
    final navbar = View.navbar("Note My Notes 🗒");

    final searchInput = InputElement()
      ..placeholder = 'Search notes...'
      ..style.width = '500px'
      ..style.fontSize = '20px'
      ..style.fontWeight = 'bold'
      ..style.height = '30px'
      ..style.marginTop = '20px'
      ..style.marginBottom = '20px'
      ..style.borderRadius = '15px 15px 15px 15px'
      ..style.padding = "20px";

    final addNoteButton = ButtonElement()
      ..text = '+'
      ..style.borderRadius = '50%'
      ..style.fontWeight = 'bold'
      ..style.color = "white"
      ..style.width = '45px'
      ..style.height = '45px'
      ..style.borderRadius = '15px'
      ..style.backgroundColor = '#fff'
      ..style.color = '#8BC34A'
      ..style.marginTop = '0px'
      ..style.marginLeft = '20px'
      ..style.fontSize = "30px";

    final notesSection = DivElement()
      ..style.display = 'grid'
      ..style.gridTemplateColumns = 'repeat(4, 1fr)'
      ..style.gap = '20px';

    final mainContainer = DivElement()
      ..style.margin = '30px 50px'
      ..children.addAll([searchInput, addNoteButton, notesSection]);

    document.body!.children.addAll([navbar, mainContainer]);

    searchInput.onSearch.listen((event) {
      // search code
    });

    String path = "${Api.users.path}/1${Api.notes.path}";
    http.get(Api.baseUrl, path).then((data) {
      list = http.parseAllNote(data);
      for (var element in list) {
        final note = View.cart("Note ${element.title}",
            DateTime.fromMillisecondsSinceEpoch(element.createdAt * 1000));
        note.onClick.listen((_) {
          http
              .delete(Api.baseUrl, path, int.parse(element.id))
              .then((value) => note.remove());
        });
        notesSection.children.add(note);
      }
    });
  }
}
