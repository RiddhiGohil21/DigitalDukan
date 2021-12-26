import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'dart:convert';
import 'itemnames.dart';
import 'models/user.dart';
import 'cust_shop_page.dart';

const String kFileName = 'myJsonFile2.json';
const String kFileName1 = 'myJsonFile22.json';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class _State extends State<MyApp> {
  GlobalKey<AutoCompleteTextFieldState<Itnames>> key = new GlobalKey();
  final List<String> name = <String>[];
  final List<String> mobile = <String>[];
  final List<String> email = <String>[];
  final List<String> language = <String>[];
  final List<String> font = <String>[];
  int count = 0;

  void _loadData() async {
    await ItemsViewModel.loadItems();
  }

  AutoCompleteTextField searchTextField;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController fontController = TextEditingController();

  bool _fileExists = false;
  File _filePath;

  List<User> _json = [];
  String _jsonString;

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName1');
  }

  void _writeJson(String name, String mobile, String email, String language,
      String font) async {
    final User user = new User(name, mobile, email, language, font);

    _json.add(user);
    print('2.(_writeJson) _json(updated): $_json');

    _jsonString = jsonEncode(_json);
    print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    _filePath.writeAsString(_jsonString);
  }

  void _readJson() async {
    _filePath = await _localFile;

    _fileExists = await _filePath.exists();
    print('0. File exists? $_fileExists');

    if (_fileExists) {
      try {
        //1. Read _jsonString<String> from the _file.
        // if (await Permission.storage.request().isGranted) {
        _jsonString = await _filePath.readAsString();
        print('1.(_readJson) _jsonString: $_jsonString');

        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        _json = jsonDecode(_jsonString);
        print('2.(_readJson) _json: $_json \n - \n');

        //}
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
    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    languageController = TextEditingController();
    fontController = TextEditingController();
    //_dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    //_selectedItem = _dropdownMenuItems[0].value;
    print('0. Initialized _json: $_json');
    _readJson();
  }

  void addItemToList() {
    if (nameController.text.isEmpty ||
        mobileController.text.isEmpty ||
        emailController.text.isEmpty ||
        languageController.text.isEmpty ||
        fontController.text.isEmpty) {
      //return;
    } else {
      setState(() {
        name.insert(0, nameController.text);
        mobile.insert(0, mobileController.text);
        email.insert(0, emailController.text);
        language.insert(0, languageController.text);
        font.insert(0, fontController.text);
        count = count + 1;
        //msgCount.insert(0, 0);
      });
    }
  }

  void check() {
    if (name.isEmpty ||
        mobile.isEmpty ||
        email.isEmpty ||
        language.isEmpty ||
        font.isEmpty) {
      return;
    }
  }

  void clearText() {
    nameController.clear();
    mobileController.clear();
    emailController.clear();
    languageController.clear();
    fontController.clear();
  }

  void sampleFunction() {
    print('Function on Click Event Called.');
    // Put your code here, which you want to execute on onPress event.
  }

//IMPORTANT
  // int _value = 1;
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings icon',
            onPressed: () {},
          )
        ],
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
//Mobile
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                  controller: mobileController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile',
                  ),
                ),
              ),
//EmailID
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'EmailId',
                  ),
                ),
              ),
//Language
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                  controller: languageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Language',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                  controller: fontController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Font',
                  ),
                ),
              ),

              const SizedBox(height: 8),
              ElevatedButton(
                child: Text('Done'),
                onPressed: () async {
                  print(
                      '0. Input key: ${nameController.text}; Input value: ${mobileController.text}; Input value: ${emailController.text}; Input key: ${languageController.text}; Input key: ${fontController.text}\n-\n');

                  _writeJson(
                    nameController.text,
                    mobileController.text,
                    emailController.text,
                    languageController.text,
                    fontController.text,
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp2()));
                  final file = await _localFile;
                  _fileExists = await file.exists();
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
            ],
          ),
        ),
      ),
    );
  }
}
