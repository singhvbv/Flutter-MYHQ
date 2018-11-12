import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/EnterOtp.dart';
import 'package:flutter1/SignUpPage.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Color.fromRGBO(0, 122, 255, 1.0) //or set color with:
    // Color(0xFF0000FF)
  ));
  runApp(new LoginPage());

}
class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: new MyLoginPage(title: 'Flutter Hello World'),
    );
  }
}

class MyLoginPage extends StatefulWidget {

  String title;

  MyLoginPage({Key key, this.title}) : super(key: key);

  @override
  MyLoginPageState createState() => new MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  int _stepper = 2;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
    child: Scaffold(

        backgroundColor: Colors.white,
        body: new ListView(

          children: <Widget>[
            // start of  Logo and gradient

            new Container(
              height: 200.0,

              //logo

              decoration: new ShapeDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end:  Alignment.bottomLeft,
                  // 10% of the width, so there are
                  // ten blinds.
                  colors: [
                    Colors.greenAccent,
                    Colors.cyan,
                    Colors.blueAccent,
                   // Colors.deepPurpleAccent,






                  ], //

                  // repeats the gradient over the canvas
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                      bottomRight: new Radius.circular(150.0)),
                ),
                image: new DecorationImage(
                  alignment: Alignment.topCenter,
                  image: new ExactAssetImage(
                    'assets/images/logo_main.png',
                    scale: 6.0,
                  ),
                ),
              ),
            ),

            //end of Logo and gradient

            //enter location text

            new Padding(
              padding: new EdgeInsets.only(
                  left: 40.0, top: 40.0, right: 0.0, bottom: 20.0),
              child: new Text(
                "Log in to My HQ",
                textAlign: TextAlign.start,
                style: new TextStyle(
                  fontFamily: 'SF-Pro',
                  color: Colors.grey,
                  decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                  fontSize: 13.0,
                ),
              ),
            ),

            //end of enter location text

            //search bar

            new Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.only(
                        left: 00.0, top: 0.0, right: 35.0, bottom: 0.0)),
                new Container(

                  child: new Flexible(
                    child: new TextFormField(

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter valid data';
                        }
                      },
                      decoration: InputDecoration(


                        /*  prefix: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.search ,size: 15.0,
                            color: Colors.black87,


                          ), // icon is 48px widget.
                        ),*/

                        hintText: 'Email,Mobile or OHIP Number',


                        isDense: true,
                      ),
                      style: new TextStyle(fontSize: 14.0,fontFamily: 'SF-Pro'
                          '',color: Colors.blueGrey),
                    ),

                  ),
                  //flexible
                ),
                new Padding(
                    padding: new EdgeInsets.only(left: 10.0, right: 25.0)),
              ],
            ),

            //end of search bar

            //discover near

            new Padding(
              padding: new EdgeInsets.only(
                  left: 0.0, top: 30.0, right: 0.0, bottom: 25.0),
              child: new Text(
                "Forgot your password?",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontFamily: 'SF-Pro',
                  color: Colors.blueGrey,
                  decorationColor: Colors.blueGrey,
                  fontSize: 12.0,
                ),
              ),
            ),

            //end of discover near

            //disances

            new Padding(
                padding: new EdgeInsets.only(top: 0.0, bottom: 0.0)),


            //end of disances


            new Padding(
                padding: new EdgeInsets.only(top: 5.0)),





            //login button

            new Padding(
                padding: new EdgeInsets.only(top: 10.0)),

            new InkWell(


              onTap: (){


                if (_formKey.currentState.validate()) {



                    print("tapped");

                    Navigator.push(
                      context,
                      new MyCustomRoute(builder: (context) => new EnterOtp()),
                    );
                  };
                  },

              child: new Container(
                margin: new EdgeInsets.symmetric(horizontal: 25.0),
                //width: 100.0,
                height: 45.0,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topRight,
                    end:  Alignment.bottomLeft,
                    // 10% of the width, so there are
                    // ten blinds.
                    colors: [
                      Colors.greenAccent,
                      Colors.cyan,
                      Colors.blueAccent,
                  //    Colors.deepPurpleAccent,


                    ], //

                    // repeats the gradient over the canvas
                  ),
                  border: null,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: new Center(child: new Text(
                  'Login', style: new TextStyle
                  (fontSize: 18.0, color: Colors.white
                ),
                ),),
              ),
            ),
            // end of Login Button

            // sign up
            new Padding(
              padding: new EdgeInsets.only(
                  left: 0.0, top: 20.0, right: 0.0, bottom: 25.0),
              child: new GestureDetector(
                onTap: () {

    Navigator.push(
    context,
    new MyCustomRoute(builder: (context) => new SignUpPage()),
    );

    print("I was tapped!"); },
      child:new Text(
        "Don't have an account ? Sign up",
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontFamily: 'SF-Pro',
          color: Colors.blueGrey,
          decorationColor: Colors.blueGrey,
          fontSize: 13.0,
        ),
      ),
    )
            ),

          //end of sign up






          ],
          )  ));
  }


}
class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

