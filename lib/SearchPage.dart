import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/Dashboard.dart';
import 'package:flutter1/DocListPage.dart';
import 'package:flutter1/LoginPage.dart';
import 'package:flutter1/SignUpPage.dart';
import 'package:material_search/material_search.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


final _city =  [
  '',
  'Toronto',
  'Montreal',
  'Ottawa',
  'Ajax',
  'Calgary',

];

String place_container  = "";


final _formKey = new GlobalKey<FormState>();
String _name = 'No one';
bool below_2 = true;
bool two_5 = false;
bool five_10 = false;
bool above_10 = false;

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Color.fromRGBO(0, 122, 255, 1.0) //or set color with:
    // Color(0xFF0000FF)
  ));
  runApp(new SearchPage());

}
class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: new MySearchPage(title: 'My HQ'),
    );
  }
}

class MySearchPage extends StatefulWidget {

  String title;

  MySearchPage({Key key, this.title}) : super(key: key);

  @override
  MySearchPageState createState() => new MySearchPageState();
}

class MySearchPageState extends State<MySearchPage> {
  int _stepper = 2;

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Place',
              results: _city.map((String v) => new
          MaterialSearchResult<String>(

                value: v,
                text: "$v",

              )).toList(),

              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim()
                    .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },

              onSelect: (dynamic value) => Navigator.of(context).pop(value),
              onSubmit: (String value) => Navigator.of(context).pop(value),
            ),
          );
        }
    );
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new ListView(

          children: <Widget>[
            // start of  Logo and gradient

            new Container(
              height: 200.0,

              //logo

              decoration: new ShapeDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end:  Alignment.bottomRight,
                  // 10% of the width, so there are
                  // ten blinds.
                  colors: [
                    Colors.greenAccent,
                    Colors.cyan,
                    Colors.blueAccent,
                  //  Colors.deepPurpleAccent,


                  ], //

                  // repeats the gradient over the canvas
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                      bottomLeft: new Radius.circular(150.0)),
                ),
                image: new DecorationImage(
                  alignment: Alignment.topCenter,
                  image: new ExactAssetImage(
                    'assets/images/logo_main.png',
                    scale: 4.0,
                  ),
                ),
              ),
            ),

            //end of Logo and gradient

            //enter location text

            new Padding(
              padding: new EdgeInsets.only(
                  left: 0.0, top: 30.0, right: 0.0, bottom: 10.0),
              child: new Text(
                "Enter your location",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontFamily: 'SF-Pro',
                  color: Color.fromRGBO(0, 122, 255, 1.0),
                  decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                  fontSize: 16.0,
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
                    child:
                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0,
                          horizontal: 10.0),
                      child: new Form(
                        key: _formKey,
                        child: new Column(
                          children: <Widget>[
                            new MaterialSearchInput<String>(
                              placeholder: 'Place',

                              results: _city.map((String v) => new
                              MaterialSearchResult<String>(

                                value: v,
                                text: "$v",
                              )).toList(),
                              filter: (dynamic value, String criteria) {
                                return value.toLowerCase().trim()
                                    .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
                              },
                              onSelect: (dynamic v) {
                                print(v);
                              },

                            ),

                          ],
                        ),
                      ),
                    ),

                  ),
                  //flexible

                ),


                new Padding(
                    padding: new EdgeInsets.only(left: 0.0, right: 10.0)),

                new IconButton(
                  icon: new Icon(Icons.place),
                  iconSize: 30.0,
                  color: Color.fromRGBO(0, 122, 255, 1.0),
                  onPressed: (){

                  //  _showMaterialSearch(context);

                    },
                ),


                new Padding(
                    padding: new EdgeInsets.only(left: 10.0, right: 15.0)),
              ],
            ),

            //end of search bar

            //discover near

            new Padding(
              padding: new EdgeInsets.only(
                  left: 0.0, top: 40.0, right: 0.0, bottom: 25.0),
              child: new Text(
                "Discover near (in mi)",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontFamily: 'SF-Pro',
                  color: Colors.blueGrey,
                  decorationColor: Colors.blueGrey,
                  fontSize: 14.0,
                ),
              ),
            ),

            //end of discover near

            //disances

            new Padding(
                padding: new EdgeInsets.only(top: 0.0, bottom: 0.0)),
            new Row  (


              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.only(left: 10.0)),

                new Text(
                  " < 2 mi",
                  textAlign: TextAlign.center,
                  style: below_2
                      ? TextStyle(
                    fontFamily: 'SF-Pro',

                    color: Color.fromRGBO(0, 122, 255, 1.0),
                    decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                    fontSize: 10.0,
                  )
                      : TextStyle(
                    fontFamily: 'SF-Pro',

                    color: Colors.grey,
                    decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                    fontSize: 10.0,
                  ),

                ),

                  new Text(
                  " < 5 mi",
                  textAlign: TextAlign.center,
                    style: two_5
                        ? TextStyle(
                      fontFamily: 'SF-Pro',

                      color: Color.fromRGBO(0, 122, 255, 1.0),
                      decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                      fontSize: 10.0,
                    )
                        : TextStyle(
                      fontFamily: 'SF-Pro',

                      color: Colors.grey,
                      decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                      fontSize: 10.0,
                    ),
                ),

                new Text(
                  "< 10 mi",
                  textAlign: TextAlign.center,
                  style: five_10
                      ? TextStyle(
                    fontFamily: 'SF-Pro',

                    color: Color.fromRGBO(0, 122, 255, 1.0),
                    decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                    fontSize: 10.0,
                  )
                      : TextStyle(
                    fontFamily: 'SF-Pro',

                    color: Colors.grey,
                    decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                    fontSize: 10.0,
                  ),
                ),

                new Text(
                  " < 15 mi",
                  textAlign: TextAlign.center,
                  style: above_10
                      ? TextStyle(
                    fontFamily: 'SF-Pro',

                    color: Color.fromRGBO(0, 122, 255, 1.0),
                    decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                    fontSize: 10.0,
                  )
                      : TextStyle(
                    fontFamily: 'SF-Pro',

                    color: Colors.grey,
                    decorationColor: Color.fromRGBO(0, 122, 255, 1.0),
                    fontSize: 10.0,
                  ),
                ),
                new Padding(
                    padding: new EdgeInsets.only(right: 10.0)),

              ],
            ),

            //end of disances

            //cupertino slider
            new Padding(
                padding: new EdgeInsets.only(top: 5.0)),

            new Container
              (

                margin: new EdgeInsets.symmetric(horizontal: 60.0),
               child: new  Slider(

                activeColor: Color.fromRGBO(0, 122, 255, 1.0),
                  inactiveColor: Colors.grey,
                  min: 0.0,
                  max: 15.0,
                  divisions: 3,
                 // label: '< ''$_stepper'' mi',
                  value: (_stepper * 1.0),
                  onChanged: (double value) {
                    setState(() {
                      _stepper = value ~/ 1;


                      if(_stepper <= 2 )

                      {
                        below_2 = true;
                      }



                      if(_stepper >=5 )

                      {
                        two_5 = true;
                      }

                      else
                      {
                        two_5 = false;
                      }

                      if(_stepper >= 10 )

                      {
                        five_10 = true;
                      }
                      else
                      {
                        five_10 = false;
                      }

                      if(_stepper == 15 )

                      {
                        above_10 = true;
                      }
                      else
                      {
                        above_10 = false;
                      }


                      print (_stepper);
                    });


                  },


                )
            ),


    //end of cupertino slider

            //search button

            new Padding(
                padding: new EdgeInsets.only(top: 30.0)),

            new InkWell(

              onTap: ()
              {
                print("tapped");
                bool validation = validate();

                if (validation) {


                }


             Navigator.push(
                context,
                new MyCustomRoute(builder: (context) => new DashboardPage()),
              );

              },


              child: new Container(
                margin: new EdgeInsets.symmetric(horizontal: 25.0),
                //width: 100.0,
                height: 45.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(color: Color.fromRGBO(0, 122, 255, 1.0), width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: new Center(child: new Text(
                  'Search', style: new TextStyle
                  (fontSize: 18.0, color: Color.fromRGBO(0, 122, 255, 1.0)
                ),
                ),),
              ),
            ),
           // end of search button

            //login button

            new Padding(
                padding: new EdgeInsets.only(top: 10.0)),

            new InkWell(

              onTap: (){print("tapped");



              Navigator.push(
                context,
                new MyCustomRoute(builder: (context) => new LoginPage()),
              );

              },

              child: new Container(
                margin: new EdgeInsets.symmetric(horizontal: 25.0),
                //width: 100.0,
                height: 45.0,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topLeft,
                    end:  Alignment.bottomRight,
                    // 10% of the width, so there are
                    // ten blinds.
                    colors: [
                      Colors.greenAccent,
                      Colors.cyan,
                      Colors.blueAccent,
                    //  Colors.deepPurpleAccent,


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
                  left: 0.0, top: 30.0, right: 0.0, bottom: 20.0),

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
        ));
  }

  bool validate() {

    if(place_container.isEmpty  ) {

      return false;
    }

    else
    {


      return true;
    }
  }
}


//custom intent

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
