import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'nextPage.dart';

class FirstScreen extends StatelessWidget {
  var files;
  final ScrollController controller = ScrollController();

  Future<String> _getFiles() async {
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0].rootDir;
    var fm = FileManager(
        root: Directory('/storage/emulated/0/jsonFiles/pending/')); //
    files = await fm.filesTree(
        excludedPaths: ["/storage/emulated/0/Android"], extensions: ["json"]);
  }

  @override
  void initState() {
    _getFiles(); //call getFiles() function on initial state.
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFiles(),
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: files?.length ?? 0,
            controller: controller,
            physics: PageScrollPhysics(),
            itemBuilder: (context, index) {
              int i = index;
              i++;
              return Card(
                  color: Colors.amber[200],
                  child: ListTile(
                    title: Text(files[index].path.split('/').last),
                    leading: Text(
                      '$i.',
                      style: TextStyle(
                        color: Color(0xFF292639),
                      ),
                    ),
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
