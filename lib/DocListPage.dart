import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/Dashboard.dart';
import 'package:flutter1/EnterOtp.dart';
import 'package:flutter1/SignUpPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color.fromRGBO(0, 122, 255, 1.0) //or set color with:
    // Color(0xFF0000FF)
  ));
  runApp(new DocListPage());

}


class DocListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctors List',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: new MyDocListPage(title: 'Doctors List'),


    );

  }
}

class MyDocListPage extends StatefulWidget {

  String title;

  MyDocListPage({Key key, this.title}) : super(key: key);

  @override
  MyDocListPageState createState() => new MyDocListPageState();
}

class MyDocListPageState extends State<MyDocListPage> {

  List<String> Doc_Name = [
    'Dr. John Doe','Dr. Jay M. Brown','Dr. William C. Regan'
    ,'Dr. Maria F. Wagner','Dr. Mary K. Carreon','Dr. Ray E. Gibson'
    ,'Dr. Tim S. Chavez'
  ];

  List<String> Doc_Image = [
    'assets/images/doc1.jpg','assets/images/doc2.jpg','assets/images/doc3.jpg'
    ,'assets/images/doc4.jpg','assets/images/doc5.jpg','assets/images/doc6.jpg'
    ,'assets/images/doc7.jpg'
  ];

  List<int> Doc_Distance = [
   1,2,4,5,6,8,9
  ];

  List<int> Doc_Verified = [
    1,1,0,0,0,1,1
  ];



  final _formKey = GlobalKey<FormState>();


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

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: <Widget>[

                          new InkWell(

                          onTap: ()
                  {



                  Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new DashboardPage()),
                  );

                  },


                  child:

                              new Row(


                                children: <Widget>[


                                  new IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    icon: new Icon(MdiIcons.lessThan),
                                    iconSize: 20.0,

                                    color: Color.fromRGBO(0, 122, 255, 1.0),
                                    onPressed: (){


                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(builder: (context) => new DashboardPage()),
                                      );

                                      //  _showMaterialSearch(context);

                                    },



                                  ),
                                  new Center(

                                    child: new Text(
                                      'Back', style: new TextStyle
                                      (fontFamily:'SF-Pro', fontSize: 13.0, color: Color
                                        .fromRGBO(0,122, 255,1.0)
                                    ),
                                    ),


                                  ),
                                ],
                              ),
                          ),
                              new Row(

                          children: <Widget>[

                         new Center(
                                child: new Text(
                                  'Ajax, Canada', style: new TextStyle
                                  (fontFamily:'SF-Pro', fontSize: 13.0,
                                    color: Colors.black
                                ),
                                ),


                              ),
                             new IconButton(
                                  icon: new Icon(Icons.near_me),
                                  iconSize: 16.0,
                                  color: Color.fromRGBO(0, 122, 255, 1.0),
                                  onPressed: (){

                                    //  _showMaterialSearch(context);

                                  },



                              ),
                        ],
                        ),

                          new Align(

                                alignment: Alignment.topRight,
                                child:  new IconButton(
                                  icon: new Icon(Icons.search),
                                  iconSize: 23.0,
                                  color: Color.fromRGBO(0, 122, 255, .5),
                                  onPressed: (){

                                    //  _showMaterialSearch(context);

                                  },
                                ),


                              )
                            ],
                          )
                      ) ,

                      //end of appbar location

                      //start of doc found
                            new Container(

                             margin: new EdgeInsets.symmetric(vertical: 10.0),

                            child:
                            new Row(

                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[
                            new Padding(
                            padding: new EdgeInsets.only(
                                left: 25.0, top: 00.0, right: 25.0, bottom:
                            00.0),),
                              new Expanded(
                                child:
                            new Center(
                             child: new Text(
                                  '7 Cardiologist found', style: new TextStyle
                                  (fontFamily:'SF-Pro', fontSize: 14.0,
                                    color: Color.fromRGBO(0, 122, 255, 1.0)
                                ),
                                ),

                            ),
                              ),

                              new Align(

                                alignment: Alignment.topRight,
                                child:  new IconButton(
                                  icon: new Icon(MdiIcons.filterOutline),
                                  iconSize: 23.0,
                                  color: Color.fromRGBO(0, 122, 255, .5),
                                  onPressed: (){

                                    //  _showMaterialSearch(context);

                                  },
                                ),


                              )

                              ],
                            ),
                            ),

                      //end of doc found
                      //listview
                      new Expanded(
                        child: new ListView.builder(

                          reverse: false,
                          itemBuilder: (_,int index)=>EachList(this.Doc_Image[index],
                              this.Doc_Name[index],this.Doc_Distance[index],
                              this.Doc_Verified[index]),
                          itemCount: this.Doc_Name.length,
                        ),
                      ),



                      //end of listview





























        ],
    ),
    ),
        ),
    );
  }

}
class EachList extends StatelessWidget{
  final String images;
  final String name;
  final int distance;
  final int verified;
   String verify_image;
  MaterialAccentColor col;

  EachList(this.images,this.name,this.distance,this.verified);



  @override
  Widget build(BuildContext context) {

    if(this.verified == 1)
    {
      verify_image =  'assets/images/verified.png';
    }
    else
    {
      verify_image =  '';
    }

    if(this.distance <= 2)
    {
     col = Colors.lightBlueAccent;
    }
    else if(this.distance > 2 && this.distance <= 6)
    {
      col = Colors.orangeAccent;
    }
    else if(this.distance > 6 )
    {
      col = Colors.redAccent;
    }



    return //list sample
      new Stack(
        children: <Widget>[



          //detail card
          new Container(
            child: new Card(
                elevation: 3.0,


                margin: new EdgeInsets.only(
                  left:MediaQuery.of(context).size.width * .14,
                  right:MediaQuery.of(context).size.width * .03,
                  top:MediaQuery.of(context).size.width * .036,
                ),
                child: new Container(


                  height: MediaQuery.of(context).size.height
                      * .12,

                  //logo

                  decoration: new ShapeDecoration(
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: new Radius.circular(8.0)
                          , bottomRight: new Radius.circular(8.0)
                          , topLeft: new Radius.circular(8.0)
                          , topRight: new Radius.circular(8.0)),
                    ),

                  ),


                )
            ),
          ),

          //  image card
          new Container(

              height: MediaQuery.of(context).size.width * .16,
              width: MediaQuery.of(context).size.width * .16,
              margin: new EdgeInsets.only(
                left:MediaQuery.of(context).size.width * .05,
                right:MediaQuery.of(context).size.width * .05,
                top:MediaQuery.of(context).size.width * .065,),

              decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 03.0,
                  ),],

                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new ExactAssetImage(
                          images)
                  )
              )),


          new Container(

              margin: new EdgeInsets.only(
                left:MediaQuery.of(context).size.width * .27,
                right:MediaQuery.of(context).size.width * .05,

                top:MediaQuery.of(context).size.width * .05,
              ),

              child: new Row
                (
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[


                  new Text(
                    name, style: new TextStyle
                    (fontFamily:'SF-Pro', fontSize: 13.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold
                  ),
                  ),

                  new Text(
                    '    ', style: new TextStyle
                    (fontFamily:'SF-Pro', fontSize: 13.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  new Image.asset(


                    verify_image,

                    scale: 35.0,

                  ),

                ],
              )

          ),

          new Container(

              margin: new EdgeInsets.only(
                left:MediaQuery.of(context).size.width * .27,
                right:MediaQuery.of(context).size.width * .05,

                top:MediaQuery.of(context).size.width * .10,
              ),

              child: new Row
                (
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  new Card(

                    color: Colors.greenAccent,


                    child: new Container(

                      padding: new EdgeInsets.only(
                          left:1.5,top:2.1,right: 3.5,bottom:
                      2.1),
                      decoration: new ShapeDecoration(

                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.only(
                              bottomLeft: new Radius
                                  .circular(2.0)
                              , bottomRight: new Radius
                              .circular(2.0)
                              , topLeft: new Radius
                              .circular(22.0)
                              , topRight: new Radius
                              .circular(2.0)),
                        ),


                      ),

                      child: new Row(
                        children: <Widget>[
                          new Image.asset(


                            'assets/images/star_white.png',

                            scale: 45.0,

                          ),
                          new Container(

                              padding :new EdgeInsets.only
                                (right: 2.0)
                          ),
                          new Text(

                            '4.7', style: new TextStyle
                            (fontFamily:'SF-Pro', fontSize:
                          10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  new Container(

                      padding :new EdgeInsets.only
                        (right: 5.0)
                  ),
                  new Text(
                    'Ajax Cardio Clinic', style: new TextStyle
                    (fontFamily:'SF-Pro', fontSize: 11.0,
                      color: Colors.grey
                  ),
                  ),


                ],
              )

          ),

          new Container(

            margin: new EdgeInsets.only(

              right:MediaQuery.of(context).size.width * .10,

              top:MediaQuery.of(context).size.width * .16,
            ),

            child:
            new Align(
              alignment: Alignment.bottomRight,
              child:new Text(
                '$distance miles away', style: new TextStyle
                (fontFamily:'SF-Pro', fontSize: 11.0,
                  color: col
              ),
              ),
            ),
          ),

          new Container(

            margin: new EdgeInsets.only(
              left:MediaQuery.of(context).size.width * .27,
              right:MediaQuery.of(context).size.width * .05,

              top:MediaQuery.of(context).size.width * .21,
            ),

            child: new Row
              (
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                new Image.asset(


                  'assets/images/heart.png',

                  scale: 43.0,

                ),
                new Container(

                    padding :new EdgeInsets.only
                      (right: 10.0)
                ),
                new Text(
                  '512 Favourites', style: new TextStyle
                  (fontFamily:'SF-Pro', fontSize: 9.0,
                    color: Colors.grey
                ),
                ),



              ],
            ),
          ),
          new Container(

            margin: new EdgeInsets.only(
              left:MediaQuery.of(context).size.width * .60,
              right:MediaQuery.of(context).size.width * .05,

              top:MediaQuery.of(context).size.width * .19,
            ),

            child: new Row
              (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[


                new Align(
                  alignment: Alignment.topRight,

                  child: new InkWell(
                    onTap: () {
                      print("tapped");
                      /*     if (_formKey.currentState.validate()) {
                      bool validation = validate();

                      if (validation) {
                        print("dtapped");




                      *//*  Navigator.push(
                          context,
                          new MyCustomRoute(
                              builder: (context) => new EnterOtp()),
                        );*//*
                      }
                    };*/
                    },

                    child: new Container(
                      margin: new EdgeInsets.symmetric(vertical: 12.0),
                      padding: new EdgeInsets.only(left:13.0
                          ,right: 13.0,top: 6.0,bottom: 7.0),
                      //width: 100.0,
                      height: 25.0,

                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(0, 122, 255, 1.0),
                        border: null,
                        borderRadius: new BorderRadius.circular
                          (12.0),
                      ),
                      child: new Center(child: new Text(
                        'Book Appointment', style: new TextStyle
                        (fontSize: 11.0, color: Colors.white
                      ),
                      ),
                      ),
                    ),
                  ),

                ),

              ],
            ),
          ),








        ],



      );


    //end of list sample
  }

}