import 'package:chat_app/components/chat_receive.dart';
import 'package:chat_app/components/chat_send.dart';
import 'package:chat_app/models/args.dart';
import 'package:chat_app/models/messages.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/services/api_service.dart' as api_service;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket socket = IO.io('http://192.168.29.16:3000');

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _chatController = TextEditingController();

  List<Message> messages = [
    Message.fromJSON({
      'mtype': 'info',
      'name': 'you',
      'message': 'You joined the Chat!',
      'date': DateTime.now().toIso8601String()
    })
  ];

  void _getMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    socket.on(prefs.getString('qrychat_key'), (data) {
      messages.add(Message.fromJSON(data));
    });

    var history = await api_service.getMessages(id: args.id);
    for (var i = 0; i < history.length; i++) {
      messages.add(history[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    socket.on('connect', (_) {
      print('Connected to Server');
    });
    _getMessages();
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          backgroundColor: Color(0xff673ab7),
          centerTitle: true,
        ),
        backgroundColor: Color(0xff4a148c),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: messages.length,
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  if (messages[index].type == 'message') {
                    return ChatSend(
                      text: messages[index].message,
                    );
                  } else {
                    return ChatReceive(
                      color: Color(0xff8bc34a),
                      text: messages[index].message,
                    );
                  }
                },
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xfff4511e)),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffff8a65),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      decoration: InputDecoration.collapsed(
                          fillColor: Color(0xffff8a65),
                          focusColor: Color(0xffff8a65),
                          hintText: "Start typing ...",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 17)),
                      controller: _chatController,
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
