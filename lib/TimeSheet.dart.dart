//
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/Bottom/HomeScreen.dart';
import 'package:flutter_basic_app/Bottom/UserScreen.dart';
import 'package:flutter_basic_app/Bottom/VideoScreen.dart';

// import 'package:flutter_basic_app/userData/BottomBar.dart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmployeeDashboard extends StatefulWidget {
  // const EmployeeDashboard({Key? key}) : super(key: key);
  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  int currentIndex = 0;
  List DashBoradList = [HomeScreen(), VideoScreen(), UserScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: CircleAvatar(
          //   radius: 20, // Adjust the radius to fit within the AppBar
          //   backgroundImage: CachedNetworkImageProvider(
          //     'https://th.bing.com/th/id/R.f06c5ea4f00a9797aae3ce14cbdf338c?rik=foJZvbQpfQFEbA&riu=http%3a%2f%2fpearl.org.in%2fwp-content%2fuploads%2f2012%2f12%2fPearl-in-shell_square_pearl.org_.in_.jpg&ehk=n4OHChfH2SN4qbubjao7a1G6uf9m0zTB4qboX555wew%3d&risl=&pid=ImgRaw&r=0',
          //   ),
          // ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
              title: Text('Item 1'),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (position) => {
          currentIndex = position,
          setState(() {}),
        },
        selectedItemColor: const Color.fromARGB(255, 255, 17, 0),
        unselectedItemColor: const Color.fromARGB(168, 0, 76, 255),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Video',
          ),
        ],
      ),
      body: DashBoradList[currentIndex],
    );
  }
}

//appbar logo, haeding and timestamp and employeeid  side bar  with accordions employee management,timesheet management,leave management and project management,
//  in body show two cards in show head "youn submitted timesheet" and thime sheet period ,start date and end date and status, onther card show head you required leave  in that
//  leave requiest period start date and end date status
