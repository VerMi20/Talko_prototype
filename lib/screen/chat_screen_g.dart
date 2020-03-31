import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat/bloc/communication/communication_bloc.dart';
import 'package:flutter_group_chat/bloc/communication/communication_event.dart';
import 'package:flutter_group_chat/model/chat_model_g.dart';
import 'package:flutter_group_chat/repository/firebase_repository.dart';
import 'package:flutter_group_chat/screen/single_chat_screen.dart';

class ChatScreen_g extends StatefulWidget {
  final String name;
  final String uid;
  ChatScreen_g({Key key,this.uid,this.name}) :super(key : key);
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen_g> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new FlatButton(
              child: new ListTile(
                // leading: new CircleAvatar(
                //   foregroundColor: Theme.of(context).primaryColor,
                //   backgroundColor: Colors.grey,
                //   backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
                // ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      dummyData[i].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      dummyData[i].time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0, left: 14),
                  child: new Text(
                    dummyData[i].message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              ), 
                   onPressed: () { 
                  //   //channelID = dummyData[i].name;
                  //   BlocProvider.of<CommunicationBloc>(context).add(JoinChatRoom());
                  //       Navigator.push(context, MaterialPageRoute(
                  //           builder: (_) =>
                  //               SingleChatScreen(
                  //                 uid: widget.uid,
                  //                 name: widget.name,
                  //                 channelId: dummyData[i].name,
                  //               )
                  //       ));
                  //       //FireRepository.getData(i);
                  }   
              ),
            ],
          ),
    );
  }
}
