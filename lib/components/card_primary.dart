import 'package:flutter/material.dart';

class CardPrimary extends StatelessWidget {
  final Widget child;

  const CardPrimary({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Color(0xff2ed573), borderRadius: BorderRadius.all(const Radius.circular(10))),
      child: this.child,
    );
  }
}
