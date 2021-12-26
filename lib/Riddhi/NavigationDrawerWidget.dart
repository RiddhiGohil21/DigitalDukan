import 'package:fs1/main.dart';

import 'DownloadPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Hello'),
              accountEmail: Text('there'),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/sale.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 48),
            buildMenuItem(
                text: 'Download',
                icon: Icons.download_done_rounded,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Upload',
                icon: Icons.send,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 2)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DownloadPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DownloadPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
        break;
    }
  }
}
