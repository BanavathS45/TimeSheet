import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/Widgets/Repeated.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Drawer Example'),
          leading: Builder(
            builder: (BuildContext context) => IconButton(
              icon: Icon(Icons.home), // Replace with your custom icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            ),
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/d.jpg"),
              ),
              title: Text('Item 1'),
              subtitle: Text("data"),
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          RepeatedScreen(bgColor: Colors.green, title: "World"),
          RepeatedScreen(
              bgColor: const Color.fromARGB(255, 122, 24, 0), title: "Red"),
          RepeatedScreen(
              bgColor: const Color.fromARGB(255, 0, 179, 255),
              title: "SkyBlue"),
          RepeatedScreen(
              bgColor: const Color.fromARGB(255, 255, 183, 0), title: "Orange"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.volume_down), label: "VolumeDown"),
      ]),
    );
  }
}
