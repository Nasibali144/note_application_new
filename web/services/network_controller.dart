import 'dart:async';
import 'dart:convert';
import 'dart:html';
import '../models/note_model.dart';
import '../models/user_model.dart';

class Network {
  Network._();
  static final _instance = Network._();
  factory Network() => _instance;

  static final header = {"Content-type": "application/json; charset=UTF-8"};

  /// Get
  Future<String> get(String baseUrl, String path, [int? id]) async {
    String url = "$baseUrl$path${id != null ? "/$id": ''}";
    return HttpRequest.request(url, method: "GET", requestHeaders: header,).then((response) {
      return response.responseText!;
    });
  }

  /// Post
  Future<String> post(String baseUrl, String path, Map<String, Object> body) async {
    String url = baseUrl + path;
    String sendData = jsonEncode(body);
    return HttpRequest.request(url, method: "POST", sendData: sendData, requestHeaders: header).then((response) {
      return response.responseText!;
    });
  }

  /// Put
  Future<String> put(String baseUrl, String path, int id, Map<String, Object> body) async {
    String url = "$baseUrl$path/$id";
    String sendData = jsonEncode(body);
    return HttpRequest.request(url, method: "PUT", sendData: sendData, requestHeaders: header,).then((response) => response.responseText!);
  }

  /// Patch
  Future<String> patch(String baseUrl, String path, int id, Map<String, Object> body) async {
    String url = "$baseUrl$path/$id";
    String sendData = jsonEncode(body);
    return HttpRequest.request(url, method: "PATCH", sendData: sendData, requestHeaders: header,).then((response) => response.responseText!);
  }


  /// Delete
  Future<String> delete(String baseUrl, String path, int id) async {
    String url = "$baseUrl$path/$id";
    return HttpRequest.request(url, method: "DELETE", requestHeaders: header).then((response) => response.responseText!);

  }

  User parseOneUser(String data) {
    Map<String, Object?> user = jsonDecode(data);
    return User.fromJson(user);
  }

  List<User> parseAllUser(String data) {
    List json = jsonDecode(data);
    List<User> users = json.map<User>((map) => User.fromJson(map)).toList();
    return users;
  }

  List<Note> parseAllNote(String data) {
    List json = jsonDecode(data);
    List<Note> notes = json.map<Note>((map) => Note.fromJson(map)).toList();
    return notes;
  }

}

enum Api {
  users("/api/v2/users"),
  notes("/notes");

  const Api(this.path);
  final String path;

  static final baseUrl = "https://642ce05cbf8cbecdb4f8cec2.mockapi.io";
}