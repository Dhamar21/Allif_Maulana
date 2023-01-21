import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_alif/DBHelper.dart';
import 'package:uas_alif/Listnote.dart';
import 'package:uas_alif/NotePage.dart';
import 'package:uas_alif/profile_screen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Smart Note',
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var db = new DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit, color: Colors.white,),
        backgroundColor: Colors.cyan,
        onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => new NotePage(null,true))),
      ),
      appBar: AppBar(
        leading: Container(
          //padding: EdgeInsets.all(10.0),
          child: Image.asset("assets/images/logo.png")),
        title: Text("Smart Note", style: TextStyle(color: Colors.white,fontSize: 25,
        fontWeight: FontWeight.w300),),
        backgroundColor: Colors.cyan,
        actions: [
           IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(
                Icons.account_box,
                size: 40,
              ))
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: db.getNote(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          var data = snapshot.data;

          return snapshot.hasData
          ? new NoteList(data)
          : Center(child: Text("No Data"),);
        },
      ),
    );
  }
}
