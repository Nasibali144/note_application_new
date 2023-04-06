import 'dart:html';

class View {
  static Element navbar(String page) {
    final navbar = Element.nav();
    navbar.style.backgroundColor = "#8BC34A";
    navbar.style.width = "100%";
    navbar.style.padding = "30px";


    final title = HeadingElement.h1();
    title.text = "Note";
    title.style.color = "white";
    title.style.size = "45px";
    title.style.margin = "0";
    title.style.float = "left";
    title.style.paddingRight = "10px";

    final pageTitle = HeadingElement.h1();
    pageTitle.text = page;
    pageTitle.style.color = "white";
    pageTitle.style.size = "25px";
    pageTitle.style.margin = "0";

    navbar.children = [title, pageTitle];
    return navbar;
  }
  
  static LabelElement label(String text) {
    final labelElement = LabelElement();
    labelElement.style.marginTop = "20px";
    labelElement.text = text;
    labelElement.style.fontSize = "20px";
    labelElement.style.display = "block";
    labelElement.style.marginBottom = "10px";
    
    return labelElement;
  }
  
  static InputElement input(String type) {
    final inputElement = InputElement(type: type);
    inputElement.style.fontSize = "18px";
    inputElement.style.padding = "10px";
    inputElement.style.width = "100%";
    inputElement.style.borderRadius = "5px";
    inputElement.required = true;
    inputElement.autofocus = true;
    inputElement.placeholder = "Enter your $type";
    inputElement.style.marginRight = "50px";
    
    return inputElement;
  }

  static ButtonElement button(String text) {
    final submitButton = ButtonElement();
    submitButton.text = text;
    submitButton.style.fontSize = "20px";
    submitButton.style.marginTop = "20px";
    submitButton.style.padding = "10px";
    submitButton.style.width = "100%";
    submitButton.style.borderRadius = "5px";
    submitButton.style.backgroundColor = "#8BC34A";
    submitButton.style.color = "white";
    submitButton.type = "submit";

    return submitButton;
  }

  static FormElement form() {
    final form = FormElement();
    form.style.margin = "50px auto";
    form.style.width = "400px";
    form.style.backgroundColor = "#ECEFF1";
    form.style.padding = "30px";
    form.style.borderRadius = "10px";
    return form;
  }

  static Element cart(String title, DateTime noteDate) {
    final note = DivElement()
      ..text = title
      ..style.backgroundColor = 'white'
      ..style.borderRadius = '15px'
      ..style.padding = '20px 30px 20px 30px'
      ..style.boxShadow = '0px 0px 10px rgba(5, 5, 5, 1.1)'
      ..style.position = 'relative'
      ..id = title;

    final date = SpanElement()
      ..text = '  Date: ${noteDate.day}.${noteDate.month}.${noteDate.year}'
      // ..text = '  Date: $noteDate'
      ..style.fontSize = '16px'
      ..style.color = '#888'
      ..style.marginBottom = '10px';

    final deleteButton = ButtonElement()
      ..text = '❌'
      ..style.position = 'absolute'
      ..style.top = '5px'
      ..style.right = '5px'
      ..style.border = 'none'
      ..style.backgroundColor = 'transparent'
      ..style.color = '#888'
      ..style.margin = "5px";

    note.children.addAll([date, deleteButton]);
    return note;
  }
  
  static TextAreaElement textArea(String title) {
    final textAreaElement = TextAreaElement();
    textAreaElement.style.fontSize = "18px";
    textAreaElement.style.padding = "10px";
    textAreaElement.style.width = "94%";
    textAreaElement.style.borderRadius = "5px";
    textAreaElement.required = true;
    textAreaElement.autofocus = true;
    textAreaElement.placeholder = "Enter your $title";
    textAreaElement.style.marginRight = "50px";
    textAreaElement.rows = 10;
    
    return textAreaElement;
  }
}