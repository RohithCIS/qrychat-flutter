import 'package:chat_app/components/chat_receive.dart';
import 'package:chat_app/components/chat_send.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                padding: EdgeInsets.all(15),
                children: <Widget>[
                  ChatSend(
                    text:
                        "Hey, How are you? lorem ipsum dolr sit amet, my name is rohith, i am developing a chat application",
                  ),
                  ChatReceive(
                    text:
                        "I'm Awesome, lorem ipsum dolor site amet, wololo, I ca't wait for MCC to come out on steam, haha, lol",
                    color: Color(0xff8bc34a),
                  )
                ],
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
                        decoration: BoxDecoration(color: Color(0xffff8a65), borderRadius: BorderRadius.circular(10)),
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
