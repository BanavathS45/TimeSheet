import 'package:flutter/material.dart';
import 'package:flutter_basic_app/Instagram.dart';
import 'package:flutter_basic_app/ListViewWidgets/Carousal.dart';
import 'package:flutter_basic_app/ListViewWidgets/GridView.dart';
import 'package:flutter_basic_app/ListViewWidgets/LIstViewDetails.dart';
import 'package:flutter_basic_app/ListViewWidgets/ListTile.dart';
import 'package:flutter_basic_app/ListViewWidgets/UserData.dart';

import '../CURD/company_screen.dart';
import '../SurecareLogin/showData.dart';

class ListViewWidget extends StatelessWidget {
  final List<String> frameWorksList =
      List.generate(10, (index) => 'Item $index');
  List<String> titles = [
    "Frameworks_Tiles",
    "Taps",
    "grid",
    "CarousalScreen",
    "Instagram",
    "GetUserData",
    "ShowApiData",
    "UserData",
    "Empty",
    "Empty",
    "Empty",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: frameWorksList.length,
        itemBuilder: (context, index) {
          return myContainer(
            bgColor: Colors.blue,
            // titles:List<String>.generate(titles.length,(i)=>titles[i]),
            titles: titles[index],
            onButtonPressed: () => _handleButtonPressed(context, index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: index % 2 == 0
                ? const Color.fromARGB(255, 55, 0, 255)
                : Colors.red,
            thickness: 10,
          );
        },
      ),
    );
  }

  void _handleButtonPressed(BuildContext context, int index) {
    // Example action: Show a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Button Pressed'),
          content: Text('You pressed the button for index $index'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                switch (index) {
                  case 0:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListViewTile(),
                      ),
                    );
                    break;
                  case 1:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => taps(),
                      ),
                    );

                    break;

                  case 2:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GridViews(),
                      ),
                    );

                    // GridView
                    break;
                  case 3:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarousalScreen(),
                      ),
                    );

                    // GridView
                    break;
                  case 4:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstagramScreen(),
                      ),
                    );

                    // GridView
                    break;
                  case 5:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyScreen(),
                      ),
                    );

                    // GridView
                    break;
                  case 6:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientListScreen(),
                      ),
                    );

                    // GridView
                    break;
                  case 7:
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserData(),
                      ),
                    );

                    // GridView
                    break;

                  // PatientListScreen
                  default:
                    Navigator.pop(context);
                }

                // Navigator.pop(context);
                // if (index == 1) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ListViewTile(),
                //     ),
                //   );
                // } else {
                //   Navigator.pop(context);
                // }
              },
            ),
          ],
        );
      },
    );
  }
}

Widget myContainer({
  required Color bgColor,
  required String titles,
  required VoidCallback onButtonPressed,
}) {
  return Container(
    width: double.infinity,
    height: 200.0,
    color: bgColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titles, style: TextStyle(fontSize: 24, color: Colors.white)),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: onButtonPressed,
          child: Text('Press Me'),
        ),
      ],
    ),
  );
}
