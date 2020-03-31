import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/screen/chat_screen_g.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_group_chat/model/chat_model_g.dart';

var gname,gdesc;

class CreateGroup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Home(),
    );
  }

}

class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  static const String flutterUrl = 'https://flutter.io/';
  static const String githubUrl = 'http://www.codesnippettalk.com';

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  TapGestureRecognizer _flutterTapRecognizer;
  TapGestureRecognizer _githubTapRecognizer;

  @override
  void initState() {
    super.initState();
    _flutterTapRecognizer = new TapGestureRecognizer()..onTap = () => _openUrl(flutterUrl);
    _githubTapRecognizer = new TapGestureRecognizer()..onTap = () => _openUrl(githubUrl);
  }

  @override
  void dispose() {
    _flutterTapRecognizer.dispose();
    _githubTapRecognizer.dispose();
    super.dispose();
  }

  void _openUrl(String url) async {
    // Close the about dialog.
    Navigator.pop(context);

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  Widget buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('New Group'),
      content: new Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildGroupName(),
          _buildGroupDesc(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            dummyData.add(new ChatModel_g(name: gname,message: gdesc,time: Timestamp.now().toString(),avatarUrl: ""));
            //Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen_g()));

          },
          textColor: Colors.teal,
          child: const Text('Create'),
        ),
      ],
    );
  }

  Widget _buildGroupName() {
        return new Container(
          padding:EdgeInsets.all(8.0),
          child: new TextFormField(
            maxLength: 30,
            autofocus: true,
            style: const TextStyle(color: Colors.black87),
            decoration: new InputDecoration(
                hintText: 'Enter Group Name...',
                icon: new Icon(
                  Icons.add_circle,
                  color: Colors.black54,
                )),
            validator: (value) => value.isEmpty ? 'Group Name can\'t be empty' : null,
            onSaved: (value)
            {
              gname = value;
              print(gname);
            }
      ),
    );
  }

  Widget _buildGroupDesc() {
    return new Container(
      padding:EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0),
      child: new TextFormField(
        maxLength: 120,
        autofocus: true,
        style: const TextStyle(color: Colors.black87),
        decoration: new InputDecoration(
            hintText: 'Enter Group Description...',
            icon: new Icon(
              Icons.dashboard,
              color: Colors.black45,
            )),
          onSaved: (value)
          {
            gdesc = value;
            print(gdesc);
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 100.0),
      decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.teal,
                          Colors.black,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
      child: new Column(
        children: <Widget>[
          buildAboutDialog(context),
        ],
      ),
    );
  }
}