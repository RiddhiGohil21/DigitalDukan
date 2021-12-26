import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'dart:convert';
import 'itemnames.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'models/user.dart';
import 'models/user1.dart';


const String kFileName12 = 'myJsonFile12.json';

void main() {
  runApp(MaterialApp(
    home: MyApp3(),
  ));
}

class MyApp3 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp3> {

 // GlobalKey<AutoCompleteTextFieldState<Itnames>> key = new GlobalKey();
  final List<String> names = <String>[];
  final List<String> quantity = <String>[];
  int count=0;

  void _loadData() async {
   // await ItemsViewModel.loadItems();
  }


 // late AutoCompleteTextField searchTextField;
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitController = TextEditingController();

  bool _fileExists = false;
 File _filePath;

  // First initialization of _json (if there is no json in the file)
  //Map<String, dynamic> _json = {};
 List <User1>  _json = [];
  String _jsonString;
// User _jsonString;

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    //final directory = (await getExternalStorageDirectory()).path + "myJsonFile2.json";
     // var path;
    return directory?.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName12');
  }

/*
  void _writeJson(String names, dynamic quantity) async {
    // Initialize the local _filePath
    //final _filePath = await _localFile;

   

     final User1 user1 = new User1(names,quantity);


    //1. Create _newJson<Map> from input<TextField>
   // Map<String,dynamic> data = {

      //'names' : user.firstName,
     //'quantity' : user.lastName,
     // 'unit' :user.website,

          //names:user

         //user.firstName:user.lastName 
      //'names' : names,
      //'quantity' : quantity,
     // 'unit':unit ,
      // user.firstName:user.lastName,
    //unit:user.website,
  //  };
    //print('1.(_writeJson) _newJson: $data');

    //2. Update _json by adding _newJson<Map> -> _json<Map>
   //_json.addAll(user);
   _json.add(user1);
    print('2.(_writeJson) _json(updated): $_json');

    //3. Convert _json ->_jsonString
    _jsonString = jsonEncode(_json);
    print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    //4. Write _jsonString to the _filePath
   // if (await Permission.storage.request().isGranted) 
      _filePath.writeAsString(_jsonString);
  }
*/

 void _writeJson(String names, dynamic quantity) async {
    // Initialize the local _filePath
    //final _filePath = await _localFile;

   

     final User1 user1 = new User1(names,quantity);


    //1. Create _newJson<Map> from input<TextField>
   // Map<String,dynamic> data = {

      //'names' : user.firstName,
     //'quantity' : user.lastName,
     // 'unit' :user.website,

          //names:user

         //user.firstName:user.lastName 
      //'names' : names,
      //'quantity' : quantity,
     // 'unit':unit ,
      // user.firstName:user.lastName,
    //unit:user.website,
  //  };
    //print('1.(_writeJson) _newJson: $data');

    //2. Update _json by adding _newJson<Map> -> _json<Map>
   //_json.addAll(user);
   _json.add(user1);
    print('2.(_writeJson) _json(updated): $_json');

    //3. Convert _json ->_jsonString
    _jsonString = jsonEncode(_json);
    print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    //4. Write _jsonString to the _filePath
    //if (await Permission.storage.request().isGranted) 
      _filePath.writeAsString(_jsonString);
  }

  void _readJson() async {
    // Initialize _filePath
    _filePath = await _localFile;

    // 0. Check whether the _file exists
    _fileExists = await _filePath.exists();
    print('0. File exists? $_fileExists');

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (_fileExists) {
      try {
        //1. Read _jsonString<String> from the _file.
        //if (await Permission.storage.request().isGranted)
        {
        _jsonString = await _filePath.readAsString();
        print('1.(_readJson) _jsonString: $_jsonString');


        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        _json = jsonDecode(_jsonString);
        print('2.(_readJson) _json: $_json \n - \n');
        }
      } catch (e) {
        // Print exception errors
        print('Tried reading _file error: $e');
        // If encountering an error, return null
      }
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
    // Instantiate _controllerKey and _controllerValue
    nameController= TextEditingController();
    quantityController = TextEditingController();
    print('0. Initialized _json: $_json');
    _readJson();
  }



  void addItemToList(){

    if(nameController.text.isEmpty ||
        quantityController.text.isEmpty) {
      //return;
    }
  
    else{
    setState(() {
      names.insert(0,nameController.text);
      quantity.insert(0,quantityController.text);
      count=count+1;
      //msgCount.insert(0, 0);
    });}

    

  }

  void check(){
    if(names.isEmpty ||
        quantity.isEmpty) {
      return;
    }
  }

  void clearText() {
    nameController.clear();
    quantityController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of items'),
        centerTitle: true,
      ),
      body: 
       
      Column(     
        children: <Widget>[    

        Row(//ROW 2
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  color: Colors.blue[200],
                  margin: EdgeInsets.all(20.0),
                  child: Text('$count')
                ),
                   ]

           ),

           

           
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item name',
              ),
            ),
          ),
          
          
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: quantityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantity',
              ),
            ),
          ),
          
          

          const SizedBox(height: 10),
          ElevatedButton(
            
            child: Text('Add'),

            
            //color: Colors.blue,
            /*
            onPressed: () {
              
             // check();
              addItemToList();
              clearText();
              //count=count+1;
             
              
            },*/

            onPressed: () async {
                  print(
                      '0. Input key: ${nameController.text}; Input value: ${quantityController.text}\n-\n');
                      
                  _writeJson(nameController.text, quantityController.text);
                  final file = await _localFile;
                  _fileExists = await file.exists();
                  //_fileName = file;

                 // setState(() {});
                  //_controllerKey.clear();
                 // _controllerValue.clear();

                  addItemToList();
                  clearText();
                },

          
          style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      onPrimary: Colors.white,
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          //fontStyle: FontStyle.italic
      ),
    ),

            
          ),
      
          
          Expanded(

            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                key: UniqueKey(),

                // only allows the user swipe from right to left
                direction: DismissDirection.endToStart,

                // Remove this product from the list 
                // In production enviroment, you may want to send some request to delete it on server side
                onDismissed: (_){
                  setState(() {
                    names.removeAt(index);
                    quantity.removeAt(index);
                    count=count-1;
                  });
                },

                // Display item's title, price..
               child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: (index) % 2 == 0 ? Colors.blue[300] : Colors.blue[200],
              elevation: 10,
              //this lesson will customize this ListItem, using Column and Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:10)),
                      Text(names[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      
                     // Text('Date: ${DateFormat.yMd().format(transactions[index].createdDate)}',
                         // style: TextStyle(fontSize: 18, color: Colors.white)),
                      Padding(padding: EdgeInsets.only(bottom:10)),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('${quantity[index]}',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2, style: BorderStyle.solid),
                            borderRadius:BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10),)
                      ],
                    )
                  )

                ],
              ),

            ),

          


            background: Container(
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),

          );
                 
                
             }

             

            )
          )

           

           
           
      

          
        ]

         



         
     )

    
      


    );
  }
}