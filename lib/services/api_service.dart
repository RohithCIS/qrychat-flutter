import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat_app/models/messages.dart';
import 'package:http/http.dart' as http;

String apiUrl = 'http://192.168.29.16:3000/';

Future<String> register() async {
  final response = await http.get(apiUrl + 'register');
  if (response.statusCode == 200) {
    var shortID = json.decode(response.body)['id'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_key', shortID);
    return shortID;
  } else {
    throw Exception('Failed to Register');
  }
}
