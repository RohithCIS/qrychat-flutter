import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSend extends StatelessWidget {
  final String text;

  ChatSend({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
                child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                  color: Color(0xffe91e63),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    this.text,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 120,
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
