//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/screen/chat_screen.dart';
import 'package:flutter_group_chat/screen/chat_screen_g.dart';
import 'package:flutter_group_chat/screen/chat_screen_p.dart';
import 'package:flutter_group_chat/screen/login_screen.dart';
import 'package:flutter_group_chat/screen/popup.dart';
import 'package:flutter_group_chat/screen/settings.dart';

import 'package:flutter_group_chat/services/authentication.dart';
import 'package:flutter_group_chat/main.dart';

import '../main.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;


  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

List<Choice> choices = const <Choice>[
    const Choice(title: 'Settings', icon: Icons.settings),
    const Choice(title: 'Log out', icon: Icons.exit_to_app),
  ];

//  void onItemMenuPress(Choice choice) {
//     if (choice.title == 'Log out') {
//       Navigator.push(context,
//    MaterialPageRoute(builder: (context) => LoginSignupPage()),
//   );
//     } else {
//       //Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//     }
//   }

class WhatsAppHome extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String name;
  final String uid;

  const WhatsAppHome({Key key, this.auth, this.logoutCallback,this.name, this.uid}) : super(key: key);

  //final List<CameraDescription> cameras;
  //WhatsAppHome({this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
      ),
      body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Contacts',
                style: new TextStyle(

                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.black,
                    onPressed: null,
                    child: new Text("Add"),
                  ),
                  new RaisedButton(
                    onPressed: null,
                    textColor: Colors.white,
                    color: Colors.black,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Subtract",
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
    _tabController.addListener(() {
      if (_tabController.index == 2) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TALKO"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "ROOMS"),
            Tab(
              text: "PERSONAL",
            ),
            Tab(
              text: "GROUP",
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          PopupMenuButton<Choice>(
            onSelected: (Choice choice){
               if (choice.title == 'Log out') 
               {
                 runApp(new HomePage());
               }
  {
      Navigator.push(context,
   MaterialPageRoute(builder: (context) => signOut()),
        );
          }  {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
          }
                  },
                  itemBuilder: (BuildContext context) {
                    return choices.map((Choice choice) {
                      return PopupMenuItem<Choice>(
                          value: choice,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                choice.icon,
                                color: Colors.teal,
                              ),
                              Container(
                                width: 10.0,
                              ),
                              Text(
                                choice.title,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ));
                    }).toList();
                  },
                ),
      //           IconButton(
      //             icon: Icon(Icons.more_vert),
      //             onPressed: ()
      //             {      
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => LoginSignupPage()),
      //   );
      // },
      //             )
              ],
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ChatScreen(uid:widget.uid,name:widget.name),
                ChatScreen_p(),
                ChatScreen_g(),
              ],
            ),
            floatingActionButton: showFab
                ? FloatingActionButton(
                    backgroundColor: Theme.of(context).accentColor,
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateGroup()),
                  );
                }
                  )
                : null,
          );
        }
   
     signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
}
