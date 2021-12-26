import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'nextPage.dart';
import 'package:permission_handler/permission_handler.dart';

class SecondScreen extends StatelessWidget {
  var files;
  final ScrollController controller = ScrollController();

  Future<String> getFiles() async {
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .rootDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(
        root: Directory('/storage/emulated/0/jsonFiles/tobedelivered')); //
    files = await fm.filesTree(
        //set fm.dirsTree() for directory/folder tree list
        excludedPaths: ["/storage/emulated/0/Android"], extensions: ["json"]);
  }

  @override
  Future<void> initState() async {
    if (await Permission.storage.request().isGranted) {
      print("Permission granted");
      //_getFiles(); //call getFiles() function on initial state.
    }
    //_getFiles(); //call getFiles() function on initial state.
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFiles(),
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            controller: controller,
            physics: PageScrollPhysics(),
            itemCount: files?.length ?? 0,
            itemBuilder: (context, index) {
              int i = index;
              i++;
              return Card(
                  color: Colors.amber[200],
                  child: ListTile(
                    title: Text(files[index].path.split('/').last),
                    leading: Text('$i.'),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF292639),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NextPage(files[index].path.toString())),
                      );
                    },
                  ));
            },
          );
        });
  }
}
