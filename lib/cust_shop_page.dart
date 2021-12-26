import 'package:flutter/material.dart';  
import 'customer_page.dart';
import 'Riddhi/main.dart';
import 'readpage.dart';


  
void main() {  
  runApp(MyApp2());  
}  
  
class MyApp2 extends StatefulWidget {  
  @override  
  _MyAppState createState() => _MyAppState();  
}  
  
class _MyAppState extends State<MyApp2> {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            title: Text('SELECT'), 
           
   // },
  //), 
      ),  
          body: Center(child: Column(children: <Widget>[  
          /*  Container(  
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                child: Text('Customer', style: TextStyle(fontSize: 20.0),),  
                 color: Colors.blueAccent, 
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp3()));
                

                },  
              ),  
            ),  */

            Container(  
              margin: EdgeInsets.fromLTRB(0,250,0,0),  
              child: FlatButton(  
                child: Text('I am a Customer', style: TextStyle(fontSize: 20.0),),  
                 color: Colors.blue,
                  textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp7()));
                

                },  
              ),  
            ),  
            Container(  
              //margin: EdgeInsets.all(25),  
              margin: EdgeInsets.fromLTRB(0,50,0,150),  

              child: FlatButton(  
                child: Text('I am a Shopkeeper', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blue,  
                textColor: Colors.white,  
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp4()));



                },  
              ),  
            ),  
          ]  
         ))  
      ),  
    );  
  }  
}  