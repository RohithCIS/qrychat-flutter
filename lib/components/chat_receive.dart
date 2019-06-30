import 'package:flutter/material.dart';

class ChatReceive extends StatelessWidget {
  final String text;
  final Color color;

  ChatReceive({Key key, @required this.text, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 40),
              decoration: BoxDecoration(
                  color: this.color, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
