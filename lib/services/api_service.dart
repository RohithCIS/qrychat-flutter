import 'dart:async';
import 'dart:convert';
import 'package:chat_app/models/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String apiUrl = 'http://192.168.29.16:3000/';

Future<String> register() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('chat_key')) {
    var id = prefs.getString('chat_key');
    return id;
  } else {
    final response = await http.get('$apiUrl' 'register');
    if (response.statusCode == 200) {
      var shortID = json.decode(response.body)['id'];
      await prefs.setString('chat_key', shortID);
      return shortID;
    } else {
      throw Exception('Failed to Register');
    }
  }
}

Future<List<Message>> getMessages({id: String}) async {
  List<Message> chat = [];
  var response = await http.get('$apiUrl' 'messages/' '$id');
  if (response.statusCode == 200) {
    var messages = json.decode(response.body);
    for (var i = 0; i < messages.length; i++) {
      chat.add(Message.fromJSON(messages[i]));
    }
    return chat;
  } else {
    throw Exception('Failed to Register');
  }
}

Future<bool> sendMessage({id: String}) async {
  return true;
}

Future<bool> joinChat({id: String, data: Object}) async {
  final response =
      await http.post('$apiUrl' 'join/' '$id', body: json.encode(data));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
