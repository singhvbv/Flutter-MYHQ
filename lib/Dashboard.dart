import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/DocListPage.dart';
import 'package:flutter1/EnterOtp.dart';
import 'package:flutter1/SignUpPage.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color.fromRGBO(0, 122, 255, 1.0) //or set color with:
    // Color(0xFF0000FF)
  ));
  runApp(new DashboardPage());

}


class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My HQ Dashboard',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: new MyDashboardPage(title: 'My HQ Dashboard'),
    );
  }
}

class MyDashboardPage extends StatefulWidget {

  String title;

  MyDashboardPage({Key key, this.title}) : super(key: key);

  @override
  MyDashboardPageState createState() => new MyDashboardPageState();
}

class MyDashboardPageState extends State<MyDashboardPage> {
  int _stepper = 2;
  int _currentIndex = 0;
  final _formKey = GlobalKey<FormState>();

  List<String> Categories = [
    'General Visit','Cardiologist','Orthopedics','Gastroenterologists',
    'Dermatologists','Ophthalmologist','Otorhinolaryngologist','Pathologist',
    'Microbiologist'
  ];

  List<String> Cat_images = [
    'assets/images/general.png','assets/images/cardio.png',
    'assets/images/ortho.png', 'assets/images/gastro.png',
    'assets/images/demo.png','assets/images/ophtha.png',
    'assets/images/ent.png', 'assets/images/patho.png',
     'assets/images/micro.png'
  ];

  List<int> cat_pinned = [
    1,1,1,0,0,0,0,0,0
  ];


  @override
  Widget build(BuildContext context) {




    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 255, 255, 1.0),

        body: new SafeArea(


       child: new Column(


        children: <Widget>[

          //appbar location
          new Container(
              color: Colors.white,
             // margin: new EdgeInsets.symmetric(vertical: 10.0),

              child:
              new Row(

                mainAxisAlignment: MainAxisAlignment.center,

       children: <Widget>[

         new Center(
                   child: new Text(
                      'Ajax, Canada', style: new TextStyle
                      (fontFamily:'SF-Pro', fontSize: 13.0, color: Color
                       .fromRGBO(0,122, 255,1.0)
                    ),
                    ),


                  ),
         new Center(
           child:  new IconButton(
             icon: new Icon(Icons.near_me),
             iconSize: 16.0,
             color: Color.fromRGBO(0, 122, 255, 1.0),
             onPressed: (){

               //  _showMaterialSearch(context);

             },
           ),


         )
          ],
              )
          ) ,

          //end of appbar location

        new Container(
            color: Colors.white,
            margin: new EdgeInsets.symmetric(horizontal: 2.0),
          child:
          new Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

                new Center(

                  child: new Padding(
                  padding: new EdgeInsets.only(
                  left: 15.0, top: 00.0, right: 0.0, bottom: 0.0),
                 child:
                  new Text(
                    'Abhishek', style: new TextStyle
                    (fontFamily:'SF-Pro', fontSize: 27.0,fontWeight:
                  FontWeight.bold,
                      color: Colors.black45,
                  ),
                  ),

                  ),
                ),
                new Center(
                  child:  new IconButton(
                    icon: new Icon(Icons.search),
                    iconSize: 23.0,
                    color: Color.fromRGBO(0, 122, 255, .5),
                    onPressed: (){

                      //  _showMaterialSearch(context);

                    },
                  ),


                )




                ]
          )



          ),

          //end of title and search

        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 9.0),

            height: MediaQuery.of(context).size.height * .09,

            //logo

            decoration: new ShapeDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topLeft,
                end:  Alignment.bottomRight,
                // 10% of the width, so there are
                // ten blinds.
                colors: [
                Color.fromRGBO(70, 206, 252, 1.0),
                Color.fromRGBO(132, 32, 202, 1.0),
                  //  Colors.deepPurpleAccent,


                ], //

                // repeats the gradient over the canvas
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    bottomLeft: new Radius.circular(8.0)
                    , bottomRight: new Radius.circular(8.0)
                    , topLeft: new Radius.circular(8.0)
                    , topRight: new Radius.circular(8.0)),
              ),

            ),
            child:  new Row (

              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget>[

                new Image.asset(

                  'assets/images/time.png',
                  scale: 17.0,

                ),
            new Column (

              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(
                      left: 25.0, top: 00.0, right: 25.0, bottom: 00.0),
                  child:
                new Text(
                  '1  Active Appointment', style: new TextStyle
                  (fontFamily:'SF-Pro', fontSize: 12.0,
                  color: Colors.white,
                ),
                ),
                ),
                new Text(
                  'View details', style: new TextStyle
                  (fontFamily:'SF-Pro', fontSize: 10.0,
                  color: Colors.white,
                ),
                ),



              ],
            ),
                new Image.asset(

                  'assets/images/notify.png',
                  scale: 23.0,

                ),



              ],
            )
        ),

          //end of first tile

          //start of two tiles
        new Container(
          margin: new EdgeInsets.symmetric(vertical: 6.0),
         child:
         new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


           new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
             width: MediaQuery.of(context).size.width * .46,
            height: MediaQuery.of(context).size.height * .09,


            //logo

            decoration: new ShapeDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topLeft,
                end:  Alignment.bottomRight,
                // 10% of the width, so there are
                // ten blinds.
                colors: [
                  Color.fromRGBO(248, 88, 162,1.0),
                  Color.fromRGBO(254, 32, 92, 1.0),
                  //  Colors.deepPurpleAccent,


                ], //

                // repeats the gradient over the canvas
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    bottomLeft: new Radius.circular(8.0)
                    , bottomRight: new Radius.circular(8.0)
                    , topLeft: new Radius.circular(8.0)
                    , topRight: new Radius.circular(8.0)),
              ),


            ),


               child:  new Row (

                 mainAxisAlignment: MainAxisAlignment.spaceAround,

                 children: <Widget>[

                   new Image.asset(

                     'assets/images/cross.png',
                     scale: 18.0,

                   ),
                   new Column (

                     mainAxisAlignment: MainAxisAlignment.center,

                     children: <Widget>[

                         new Text(
                           '2 Expired\nAppoinments', style: new TextStyle
                           (fontFamily:'SF-Pro', fontSize: 11.0,
                           color: Colors.white,
                         ),
                           textAlign: TextAlign.center,
                         ),

                       new Text(
                         'View details', style: new TextStyle
                         (fontFamily:'SF-Pro', fontSize: 9.0,
                         color: Colors.white,
                       ),
                         textAlign: TextAlign.center,
                       ),



                     ],
                   ),




                 ],
               )

           ),

           new Container(
             margin: new EdgeInsets.symmetric(horizontal: 4.0),
             width: MediaQuery.of(context).size.width * .46,
             height: MediaQuery.of(context).size.height * .09,


             //logo

             decoration: new ShapeDecoration(
               gradient: new LinearGradient(
                 begin: Alignment.topLeft,
                 end:  Alignment.bottomRight,
                 // 10% of the width, so there are
                 // ten blinds.
                 colors: [
                   Color.fromRGBO(40, 242, 156, 1.0),
                   Color.fromRGBO(12, 184, 224, 1.0),
                   //  Colors.deepPurpleAccent,


                 ], //

                 // repeats the gradient over the canvas
               ),
               shape: new RoundedRectangleBorder(
                 borderRadius: new BorderRadius.only(
                     bottomLeft: new Radius.circular(8.0)
                     , bottomRight: new Radius.circular(8.0)
                     , topLeft: new Radius.circular(8.0)
                     , topRight: new Radius.circular(8.0)),
               ),

             ),

               child:  new Row (

                 mainAxisAlignment: MainAxisAlignment.spaceAround,

                 children: <Widget>[

                   new Image.asset(

                     'assets/images/check.png',
                     scale: 18.0,

                   ),
                   new Column (

                     mainAxisAlignment: MainAxisAlignment.center,

                     children: <Widget>[

                       new Text(
                         '5 Completed \nAppoinments', style: new TextStyle
                         (fontFamily:'SF-Pro', fontSize: 11.0,
                         color: Colors.white,
                       ),
                         textAlign: TextAlign.center,
                       ),

                       new Text(
                         'View details', style: new TextStyle
                         (fontFamily:'SF-Pro', fontSize: 9.0,
                         color: Colors.white,
                       ),
                         textAlign: TextAlign.center,
                       ),



                     ],
                   ),




                 ],
               )
           ),

        ],
         ),    ),





          //end of two tiles

          //listview
          new Expanded(
            child: new ListView.builder(

              reverse: false,
              itemBuilder: (_,int index)=>EachList(this.Cat_images[index],
                  this.Categories[index],this.cat_pinned[index]),
              itemCount: this.Categories.length,
            ),
          ),



          //end of listview












          ],
        ),
    ), bottomNavigationBar:   new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromRGBO(0, 122, 255, 1.0),
        currentIndex: _currentIndex,
        onTap: (value) {
         print(value);

         Navigator.push(
           context,
           new MyCustomRoute(builder: (context) => new DocListPage()),
         );


        },//
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(

            icon: new Image.asset( 'assets/images/profile.png',
            scale: 25.00,),
            title: new Text('User',style: new TextStyle(
                fontFamily: 'SF-Pro',

                fontSize: 10.0
            ),),
          ),
          BottomNavigationBarItem(

            icon: new Image.asset( 'assets/images/heart.png',
              scale: 25.00,),
            title: new Text('Favourites',style: new TextStyle(
                fontFamily: 'SF-Pro',

                fontSize: 10.0
            ),),
          ),
          BottomNavigationBarItem(

            icon: new Image.asset( 'assets/images/history.png',
              scale: 25.00,),
            title: new Text('History',style: new TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 10.0
            ),),
          ),
          BottomNavigationBarItem(

            icon: new Image.asset( 'assets/images/notification.png',
              scale: 25.00,),
            title: new Text('Alerts',style: new TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 10.0
            ),),
          ),
        ],
      )
        ,
        ),

    );
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

class EachList extends StatelessWidget{
  final String name;
  final String images;
  final int pinned;
  String pinned_image;

  EachList(this.images,this.name,this.pinned);



  @override
  Widget build(BuildContext context) {
    if(this.pinned == 1)
    {
      pinned_image =  'assets/images/pin.png';
    }
    else
    {
      pinned_image =  'assets/images/unpin.png';
    }
    return new Card(
      elevation: 2.0,

      margin: new EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: new Container(

        decoration: new ShapeDecoration(

          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                bottomLeft: new Radius.circular(8.0)
                , bottomRight: new Radius.circular(8.0)
                , topLeft: new Radius.circular(8.0)
                , topRight: new Radius.circular(8.0)),
          ),

        ),

        padding: EdgeInsets.only(top:11.0,right :8.0,left: 8.0,bottom: 11.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            new Image.asset(

              images,
              scale: 14.0,

            ),

        new GestureDetector(

        onTap: ()
    {

    Navigator.push(
    context,
    new MyCustomRoute(builder: (context) => new DocListPage()),
    );
    },

        child:  new Text(
            name, style: new TextStyle
            (fontFamily:'SF-Pro', fontSize: 15.0,fontWeight: FontWeight.w400,
            color: Color
                .fromRGBO(0,151, 167,1.0),
          ),
          ),
    ),



            new Image.asset(

              pinned_image,
              scale: 25.0,

            ),

          ],
        ),
      ),
    );
  }

}
