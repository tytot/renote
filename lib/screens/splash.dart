import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renote/screens/note_list.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    FirebaseAuth.instance
      .currentUser()
      .then((currentUser) => {
        if (currentUser == null){
          Navigator.pushReplacementNamed(context, "/login")
        } else {
          Firestore.instance
            .collection("users")
            .document(currentUser.uid)
            .get()
            .then((DocumentSnapshot result) =>
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteList(
                      uid: currentUser.uid,
                    ))))
            .catchError((err) => print(err))
        }
      })
      .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(child: Container(color: Theme.of(context).primaryColor, height: 4.0,), preferredSize: Size.fromHeight(4.0)),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Loading(indicator: BallPulseIndicator(), size: 80.0, color: Theme.of(context).accentColor),
        )
      ),
    );
  }
}