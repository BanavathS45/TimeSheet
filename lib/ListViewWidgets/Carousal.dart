import 'package:flutter/material.dart';
import 'package:flutter_basic_app/userData/Registration.dart';

class CarousalScreen extends StatefulWidget {
  Color? colored;
  CarousalScreen({super.key, this.colored});
  @override
  State<CarousalScreen> createState() => _CarousalScreenState();
}

class _CarousalScreenState extends State<CarousalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousal Screen'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context, // Added the required context parameter
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Do you Wnat logout ?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => RegistrationScreen()),
                                (route) => false);
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          myPage(1, Colors.red),
          myPage(2, const Color.fromARGB(255, 0, 26, 255)),
          myPage(3, const Color.fromARGB(255, 255, 0, 238)),
          myPage(4, const Color.fromARGB(255, 13, 255, 0)),
        ],
      ),
    );
  }

  myPage(int index, Color colored) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 600,
        color: colored,
        child: Center(
          child: Text(
            "page_${index}",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    ]);
  }
}
