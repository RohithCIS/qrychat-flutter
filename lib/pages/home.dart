import 'package:chat_app/components/card_primary.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _codeInputController = TextEditingController();

  @override
  void dispose() {
    _codeInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff0F1F41),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30),
        // decoration: BoxDecoration(color: const Color(0xFF2ed573)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              CardPrimary(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Your Code:', style: TextStyle(color: Colors.white)),
                    Text(
                      'WX254E',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.share),
                      color: Colors.white,
                      iconSize: 40,
                      padding: EdgeInsets.all(20),
                      tooltip: 'Share Code',
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.content_copy),
                      color: Colors.white,
                      iconSize: 40,
                      padding: EdgeInsets.all(20),
                      tooltip: 'Copy to Clipboard',
                      onPressed: () {})
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                child: TextField(
                  controller: _codeInputController,
                  maxLength: 6,
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                  cursorColor: Color(0xff2ed573),
                  decoration: InputDecoration(
                      labelText: "Enter Code",
                      labelStyle:
                          TextStyle(color: Color(0xff2ed573), fontSize: 35),
                      counterStyle: TextStyle(color: Color(0xff2ed573)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff2ed573))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Color(0xff2ed573), width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Color(0xff2ed573), width: 3))),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat');
                },
                color: Color(0xff2ed573),
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text('Join Chat',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
