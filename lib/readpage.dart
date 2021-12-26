import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:file_manager/file_manager.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:fs1/customer_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider_ex/path_provider_ex.dart';
//import package files

void main() => runApp(MyApp7());
class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          home: MyFileList(), //call MyFile List 
    );
  }
}

//apply this class on home: attribute at MaterialApp()
class MyFileList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyFileList();
  }
}

class _MyFileList extends State<MyFileList>{
  var files;
 
  void getFiles() async { //asyn function to get list of files
      List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
      var root = storageInfo[0].rootDir; 
      var fm = FileManager(root: Directory("/storage/emulated/0/Android/jsonFiles/customer/")); 
      //storageInfo[1] for SD card, geting the root directory
      //var fm = FileManager(root: Directory("/storage/emulated/0/Android/jsonFiles/customer/"),// builder: (BuildContext context, List<FileSystemEntity> snapshot) {  }, controller: null,); //
      files = await fm.filesTree( 
      //set fm.dirsTree() for directory/folder tree list
        excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["png", "pdf","json"] //optional, to filter files, remove to list all,
        //remove this if your are grabbing folder list
      );
      setState(() {}); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state. 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Read files"),
        backgroundColor: Colors.blue,
         automaticallyImplyLeading: false,
  leading: IconButton (
                 icon: Icon(Icons.arrow_back),
                 onPressed: () { 
                       Navigator.pop(context);
                       
                 },
  ),
                /* actions: [
    Container(child: Icon(Icons.more_vert)),
    
  ],*/
  actions: [
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp3()),
              );
            },
          ),
        ],
            

      ),
      body:files == null? Text("Searching Files"):
           ListView.builder(  //if file/folder list is grabbed, then show here
              itemCount: files?.length ?? 0,
              itemBuilder: (context, index) {
                    return Card(
                      child:ListTile(
                         title: Text(files[index].path.split('/').last),
                         leading: Icon(Icons.image),
                         trailing: Icon(Icons.delete, color: Colors.redAccent,),
                      )
                    );
              },

              
          )
    );
  }
}