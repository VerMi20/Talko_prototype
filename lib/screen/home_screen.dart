
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat/bloc/auth/bloc.dart';
import 'package:flutter_group_chat/bloc/communication/bloc.dart';
import 'package:flutter_group_chat/bloc/user/bloc.dart';
import 'package:flutter_group_chat/model/user.dart';
import 'package:flutter_group_chat/screen/single_chat_screen.dart';
import 'package:flutter_group_chat/screen/style/theme.dart' as theme;
import 'package:flutter_group_chat/screen/whatsapp_home.dart';

class HomePage extends StatefulWidget {
  final String uid;
    HomePage({Key key,this.uid}) :super(key : key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<CommunicationBloc>(context).add(MessagesLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: BlocBuilder<UserBloc,UserState>(
      builder: (BuildContext context,UserState state){
        if (state is UserLoaded){
          final user =state.users.firstWhere((user) => user.uid == widget.uid , orElse: () => User());

          return _buildSingleChildScrollView(context,user.name);
        }
        return Container(child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Loading..."),
            CircularProgressIndicator(),
          ],
        ),),);
      },
      )
    );
  }

  Widget _myWidget1(BuildContext context) {
      String myString = '© PYMETRICS';
      print(myString);
      return Text(
        myString,
        
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: "WorkSansSemiBold",
          color: Colors.white,
          ),
        
      );
    }

    Widget _myWidget2(BuildContext context) {
      String myString = 'Parented By IIIT Nagpur';
      print(myString);
      return Text(
        myString,
        
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: "WorkSansSemiBold",
          color: Colors.white,
          ),
        
      );
    }


  SingleChildScrollView _buildSingleChildScrollView(BuildContext context,String name) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height >= 775.0
            ? MediaQuery.of(context).size.height
            : 775.0,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                theme.ThemeColors.loginGradientStart,
                theme.ThemeColors.loginGradientEnd,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 20,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.exit_to_app,size: 40,),
                  onPressed: (){
                    BlocProvider.of<AuthBloc>(context)..add(LoggedOutEvent());
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Welcome ",style: TextStyle(
                          fontFamily: 'rocks',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(name.toUpperCase(),style: TextStyle(
                          fontSize: 25,
                          fontFamily:"WorkSansBold" ,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    Text("Join Us For fun",style: TextStyle(
                      fontFamily: 'rocks',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10,),
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      color: Colors.black,
                      child: Text(
                        "Join",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                        ),
                      ),
                      onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WhatsAppHome(uid:widget.uid,name:name)),
                  );
                        
                      },
                    ), Padding(
            padding: EdgeInsets.only(top: 10.0),
            child:_myWidget1(context),
          ),
          
           Padding(
            padding: EdgeInsets.only(top: 10.0),
            child:_myWidget2(context),
          ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}