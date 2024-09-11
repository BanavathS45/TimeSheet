import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Your Submitted Timesheets',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Timesheet Period: 2022-03-01 to 2022-03-31'),
                        SizedBox(height: 10),
                        Text('Start Date: 2022-03-01'),
                        SizedBox(height: 10),
                        Text('End Date: 2022-03-31'),
                        SizedBox(height: 10),
                        Text('Status: Approved'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Your Requested Leaves',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Leave Request Period: 2022-04-01 to 2022-04-10'),
                        SizedBox(height: 10),
                        Text('Start Date: 2022-04-01'),
                        SizedBox(height: 10),
                        Text('End Date: 2022-04-10'),
                        SizedBox(height: 10),
                        Text('Status: Pending'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
