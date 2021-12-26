import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'Items.dart';

Color cardCol = Colors.red[200];
int count = 0;
String val = "";
final List<bool> _selected = List.generate(20, (i) => false);

// ignore: must_be_immutable
class NextPage extends StatefulWidget {
  String path;

  NextPage(this.path);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  TextEditingController costController = TextEditingController();
  final _scrollController = ScrollController();
  Future<String> readCounter() async {
    try {
      final file = File('${widget.path}');

      // Read the file
      String contents = await file.readAsString();

      var name = jsonDecode(contents)['name'];
      var items = jsonDecode(contents)['shoplist'] as List;
      List<Tag> tag = items.map((items) => Tag.fromJson(items)).toList();

      print(name);
      print(tag);

      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      return 'success';
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item List"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Form(
          child: Center(
            child: Container(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var mydata = jsonDecode(snapshot.data);
                    var items = mydata['shoplist'] as List;
                    List<Tag> tag =
                        items.map((items) => Tag.fromJson(items)).toList();
                    List<Quant> quant =
                        items.map((items) => Quant.fromJson(items)).toList();
                    List<Cost> ucost =
                        items.map((items) => Cost.fromJson(items)).toList();
                    return Column(children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 15,
                            ),
                            Card(
                              color: Colors.blue[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(17, 5, 0, 0),
                                height: 100,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      mydata['name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      mydata['mobile'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Color(0xFF292639),
                              child: ListTile(
                                  leading: Text(
                                      "Sr.         Items                                  Quantity",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                            ),
                            Container(
                              height: 350,
                              child: Scrollbar(
                                controller: _scrollController,
                                thickness: 10,
                                isAlwaysShown: true,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        tag.length != null ? tag.length : 0,
                                    itemBuilder: (_, index) {
                                      int id = index;

                                      return Card(
                                        child: ListTile(
                                          tileColor: _selected[index]
                                              ? Colors.greenAccent
                                              : Colors.redAccent,
                                          leading: Text("${++id}."),
                                          title: Text("${tag[index]}"),
                                          subtitle: Text(
                                            "${ucost[index]}",
                                          ),
                                          trailing: Container(
                                            width: 80,
                                            height: 50,
                                            color: Colors.grey[50],
                                            child: TextField(
                                                onChanged: (text) {
                                                  print("$text");
                                                },
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText:
                                                        "${quant[index]}"),
                                                autofocus: false),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _selected[index] =
                                                  !_selected[index];
                                            });
                                          },
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]);
                  }
                  return CircularProgressIndicator();
                },
                future: readCounter(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
