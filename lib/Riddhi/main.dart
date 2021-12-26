import 'FirstScreen.dart';
import 'NavigationDrawerWidget.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp4());

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFileList(),
    );
  }
}

class MyFileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFileList();
  }
}

class _MyFileList extends State<MyFileList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  Future<String> _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      print("Permission granted");
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    _getStoragePermission();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text("Kirana"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/sale.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/sale.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/sale.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
                options: CarouselOptions(
                  height: 170.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                ),
              ),

              //Container(
              //  child: Image.asset('assets/images/sale.jpg',
              //      width: 300, height: 150, fit: BoxFit.fill),
              //),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Color(0xFF292639),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8)),
                    //controller: _tabController,
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.assignment_late_rounded,
                          color: Colors.red[600],
                        ),
                        //text: "Pending",
                      ),
                      Tab(
                        icon: Icon(Icons.notifications,
                            color: Colors.orangeAccent),
                        //text: "To be delivered",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.assignment_turned_in_rounded,
                          color: Colors.greenAccent,
                        ),
                        //text: "Delivered",
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(child: FirstScreen()),
                        const SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Pending List",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF292639),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SecondScreen(),
                        const SizedBox(
                          height: 45,
                        ),
                        Text(
                          "To be Delivered List",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF292639),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ThirdScreen(),
                        const SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Delivered List",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF292639),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
