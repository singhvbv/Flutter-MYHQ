
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/Dashboard.dart';
import 'package:flutter1/EnterOtp.dart';
import 'package:flutter1/SearchPage.dart';
import 'package:flutter1/LoginPage.dart';
import 'package:flutter1/SignUpPage.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My HQ',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new SearchPage(),
    );
  }


/*class MyHomePage extends StatefulWidget {
  String title;


  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {


    return new Scaffold(

      appBar: AppBar(

        title: new Text("Screen 1"),
        backgroundColor: Colors.red,
      ),

      body: new Center(

    ),
    );
  }*/


}