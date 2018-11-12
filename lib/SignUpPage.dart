import 'package:flutter/material.dart';
import 'package:flutter1/EnterOtp.dart';
import 'package:flutter1/LoginPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';



import 'dart:async';

TextStyle textStyle = new TextStyle(
    color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.bold);

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  State createState() => new StartSearchPage();
}

class User {
  const User(this.name);

  final String name;
}

class StartSearchPage extends State<SignUp>
    with SingleTickerProviderStateMixin {
  final Color primaryColor;
  final Color backgroundColor;
  User selectedUser;
  String _datetime = 'tap date icon to edit';
  int year = 2018;
  int month = 6;
  int date = 3;

  int radioValue;
  String radio_checker;
  final _formKey = GlobalKey<FormState>();
  List<User> users = <User>[const User('Foo'), const User('Bar')];

  void settingDatetime(int year, int month, int date) {
    setState(() {
      /* if(month == 1 ) { this.month = "January";}
    else if (month == 2 ) { this.month = "Febuary";}
    else if (month == 3 ) { this.month = "March";}
    else if (month == 4 ) { this.month = "April";}
    else if (month == 5 ) { this.month = "May";}
    else if (month == 6 ) { this.month = "June";}
    else if (month == 7 ) { this.month = "July";}
    else if (month == 8 ) { this.month = "August";}
    else if (month == 9 ) { this.month = "September";}
    else if (month == 10 ) { this.month = "October";}
    else if (month == 11 ) { this.month = "November";}
    else if (month == 12 ) { this.month = "December";}*/

      this.year = year;
      this.month = month;

      this.date = date;
      _datetime = '$date/$month/$year';
    });
  }


  // Method setting value.
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

     radio_checker = "done";
    });
  }


  // final AssetImage backgroundImage;

  StartSearchPage(
      {Key key, this.primaryColor, this.backgroundColor //this.backgroundImage
      });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            new ListView(shrinkWrap: true, children: <Widget>[
              new Column(
                children: <Widget>[
                  // start of  Logo and gradient

                  new Container(
                    height: 100.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 15.0),

                    child: new Image(
                      alignment: Alignment.topCenter,
                      image: new ExactAssetImage(
                        'assets/images/logo_gradient.png',
                        scale: 6.0,
                      ),
                    ),


                  ),


                  new Text(
                    "Sign up",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: 'GEOMA_',
                      color: Colors.blueGrey,
                      decorationColor: Colors.blueGrey,
                      fontSize: 26.0,
                    ),
                  ),


                  //end of Logo and gradient


                  /* new Container(
                  height: MediaQuery.of(context).size.height * .20,
                  color: Colors.white,
                ),*/
                  new Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    //height: MediaQuery.of(context).size.height,
                    child: Column(

                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        new ListTile(
                          leading: const Icon(
                            Icons.person, color: Colors.blueGrey,),
                          title: new TextFormField(

                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter name';
                              }
                            },
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.blueGrey,

                              decorationColor: Colors.blueGrey,
                              fontSize: 13.0,
                            ),
                            decoration: new InputDecoration(

                              hintText: "Name",
                            ),
                          ),

                        ),

                        new ListTile(
                          leading: const Icon(
                            Icons.email, color: Colors.blueGrey,),
                          title: new TextFormField(

                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter email address';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.blueGrey,

                              decorationColor: Colors.blueGrey,
                              fontSize: 13.0,
                            ),
                            decoration: new InputDecoration(

                              hintText: "Email",
                            ),
                          ),

                        ),

                        new ListTile(

                          leading: const Icon(
                            Icons.phone, color: Colors.blueGrey,),
                          title: new TextFormField(

                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter phone';
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
                              hintText: "Phone no.",
                            ),
                          ),

                        ),

                        new ListTile(
                          leading: const Icon(
                            Icons.list, color: Colors.blueGrey,),
                          title: new TextFormField(

                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter OHIP no.';
                              }
                            },
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.blueGrey,

                              decorationColor: Colors.blueGrey,
                              fontSize: 13.0,
                            ),
                            decoration: new InputDecoration(

                              hintText: "OHIP No.",
                            ),
                          ),

                        ),

                        new ListTile(

                          leading: new IconButton(
                            icon: const Icon(Icons.today),
                            alignment: Alignment.topLeft,
                            padding: new EdgeInsets.only(top: 10.0),
                            color: Colors.blueGrey,
                            onPressed: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                locale: 'en',
                                minYear: 1920,
                                maxYear: 2018,
                                initialYear: 1990,
                                initialMonth: 6,
                                initialDate: 21,
                                dateFormat: 'yyyy-mm-dd',
                                onChanged: (year, month, date) {

                                },
                                onConfirm: (year, month, date) {
                                  settingDatetime(year, month, date);
                                  print('$date' '$month');
                                },
                              );
                            },
                          ),
                          title: new Text(

                            "Date of birth",
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.black45,

                              decorationColor: Colors.black45,
                              fontSize: 15.0,
                            ),

                          ),
                          subtitle: new Text(
                            _datetime,

                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.blueGrey,

                              decorationColor: Colors.blueGrey,
                              fontSize: 13.0,
                            ),
                          ),
                        ),


                        // START selectioncontrols_radio
                        // Member variable holding value.


                        // Creates a set of radio buttons.
                        new Row(


                            children: <Widget>[
                              new Padding(padding: new EdgeInsets.all(2.0)),


                              Radio<int>(

                                  value: 0,

                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged

                              ),
                              new Text(
                                "Male",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  color: Colors.black45,

                                  decorationColor: Colors.black45,
                                  fontSize: 13.0,
                                ),
                              ),


                              new Padding(padding: new EdgeInsets.all(4.0)),


                              Radio<int>(
                                  value: 1,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged


                              ),
                              new Text(
                                "Female",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  color: Colors.black45,

                                  decorationColor: Colors.black45,
                                  fontSize: 13.0,
                                ),
                              ),


                              new Padding(padding: new EdgeInsets.all(3.0)),


                              new Padding(padding: new EdgeInsets.all(1.0)),


                              Radio<int>(
                                  value: 2,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged


                              ),
                              new Text(
                                "Others",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  color: Colors.black45,

                                  decorationColor: Colors.black45,
                                  fontSize: 13.0,
                                ),
                              ),


                            ]
                        ),


                        // END


                        //signup button

                        new Padding(
                            padding: new EdgeInsets.only(top: 30.0)),

                        new InkWell(
                          onTap: () {
                            print("tapped");
                            if (_formKey.currentState.validate()) {
                              bool validation = validate();

                              if (validation) {
                                print("dtapped");

                            


                              Navigator.push(
                                context,
                                new MyCustomRoute(
                                    builder: (context) => new EnterOtp()),
                              );
                              }
                            };
                          },

                          child: new Container(
                            margin: new EdgeInsets.symmetric(horizontal: 15.0),
                            //width: 100.0,
                            height: 45.0,
                            decoration: new BoxDecoration(
                              gradient: new LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
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
                              'Sign up', style: new TextStyle
                              (fontSize: 18.0, color: Colors.white
                            ),
                            ),),
                          ),
                        ),
                        // end of signup Button


// sign up
                        new Padding(
                            padding: new EdgeInsets.only(
                                left: 0.0, top: 30.0, right: 0.0, bottom: 25.0),
                            child: new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  new MyCustomRoute(builder: (context) =>
                                  new
                                  LoginPage()),
                                );

                                print("I was tapped!");
                              },
                              child: new Text(
                                "Already have an account? Login",
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
                    ),
                  )
                ],
              )
            ]),
          ],
        ),

      ),
    );
  }


  bool validate() {

    if(_datetime.isEmpty || radio_checker.isEmpty || _datetime == "tap date icon to edit" ) {

      return false;
    }

    else
    {


      return true;
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


