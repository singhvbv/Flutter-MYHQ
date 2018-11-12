import 'package:flutter/material.dart';
import 'package:flutter1/Dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


TextStyle textStyle = new TextStyle(
    color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.normal);

class EnterOtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new EnterOtp(),
    );
  }
}

class EnterOtp extends StatefulWidget {
  @override
  State createState() => new StartSearchPage();
}

class User {
  const User(this.name);
  final String name;
}

class StartSearchPage extends State<EnterOtp>
    with SingleTickerProviderStateMixin {
  final Color primaryColor;
  final Color backgroundColor;
  User selectedUser;
  List<User> users = <User>[const User('Foo'), const User('Bar')];
  final _formKey = GlobalKey<FormState>();
  final otpcontroller = TextEditingController();

  // final AssetImage backgroundImage;

  StartSearchPage(
      {Key key, this.primaryColor, this.backgroundColor //this.backgroundImage
      });



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Scaffold(
        backgroundColor: Colors.white,

        body: new ListView(

          children: <Widget>[

            new Stack(
              children: <Widget>[
                // The containers in the background
                new Column(
                  children: <Widget>[
                    new Container(
                        height: MediaQuery.of(context).size.height * .20,
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

                          ),

                        ),
                        padding: new EdgeInsets.only(top: 30.0),
                        child: new Align(
                          alignment: Alignment.topCenter,

                          child: new Text(
                            "OTP Verfication",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.white,
                              decorationColor: Colors.blueGrey,
                              fontSize: 25.0,
                            ),
                          ),

                        )
                    ),

                  ],
                ),
                // The card widget with top padding,
                // incase if you wanted bottom padding to work,
                // set the `alignment` of container to Alignment.bottomCenter
                new Container(
                  alignment: Alignment.topCenter,
                  padding: new EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .06,
                      right: 20.0,
                      left: 20.0),
                  child: new Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    child: new  Icon(
                      MdiIcons.messageAlertOutline, color: Color.fromRGBO
                      (99, 217, 194, 1.0),size:
                    100.00,),
                  ),
                ),



              ],
            ),


            new Container(
              padding: new EdgeInsets.only(left: 70.0,right: 70.0),
              child: new  TextFormField(

                textAlign: TextAlign.center,
                controller: otpcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter otp';
                  }
                },
                keyboardType: TextInputType.number,
                style: TextStyle(

                  fontFamily: 'SF-Pro',
                  color: Colors.blueGrey,



                  decorationColor: Colors.blueGrey,
                  fontSize: 13.0,
                ),
                decoration: new InputDecoration(
                  hintText: "Enter OTP",



                ),
              ),

            ),


            new Container(
              padding: new EdgeInsets.only(left : 50.00,
                  right:50.00,top: 50.00),
              child: new Text(
                "We have sent you an access code via SMS for "
                    "Mobile number verification.",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontFamily: 'SF-Pro',
                  color: Colors.blueGrey,
                  decorationColor: Colors.blueGrey,
                  fontSize: 13.0,
                ),
              ),



            ),


            new Container(
                padding: new EdgeInsets.only(top: 70.00),
                child: new FloatingActionButton(
                  elevation: 5.0,

                  backgroundColor: Color.fromRGBO(0, 122, 255, 1.0),
                  onPressed: _dashboard,

                  tooltip: 'Submit',
                  child: Icon(MdiIcons.greaterThan),
                )



            ),

            new Container(
              padding: new EdgeInsets.only(top: 40.00),
              child: new InkWell(

                onTap: ()
                {
                  print("tapped");




                },


                child: new Container(
                  margin: new EdgeInsets.symmetric
                    (horizontal: 145.0),
                  //width: 100.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    /*  border: new Border.all(color: Color.fromRGBO(0, 122, 255, 1.0), width: 2.0),
                                      borderRadius: new BorderRadius.circular(10.0),*/
                  ),
                  child: new Center(child: new Text(
                    'Resend', style: new TextStyle
                    (fontSize: 13.0, color: Color.fromRGBO
                    (0, 122, 255, 1.0)
                  ),
                  ),),
                ),
              ),



            ),


          ],
        ),
      ),



    );
  }

  _dashboard() {

if(otpcontroller.text.isNotEmpty) {
  Navigator.push(
    context,
    new MyCustomRoute(builder: (context) => new DashboardPage()),
  );
}

  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
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
