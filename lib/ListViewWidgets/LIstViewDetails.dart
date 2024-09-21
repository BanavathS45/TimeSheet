import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class taps extends StatelessWidget {
  final String title, imgLogo;
  const taps({super.key, this.title = "Tabs", this.imgLogo = ""});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(tabs: [
            const Tab(icon: Icon(Icons.home)),
            const Tab(icon: Icon(Icons.flight)),
            const Tab(icon: Icon(Icons.train)),
          ]),
        ),
        body: const TabBarView(children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 100, color: Colors.teal),
                Text(
                  'Welcome to the Home tab!',
                  style: TextStyle(fontSize: 24, color: Colors.teal),
                ),
              ],
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flight, size: 100, color: Colors.teal),
                Text(
                  'Welcome to the flight tab!',
                  style: TextStyle(fontSize: 24, color: Colors.teal),
                ),
              ],
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.train, size: 100, color: Colors.teal),
                Text(
                  'Welcome to the train tab!',
                  style: TextStyle(fontSize: 24, color: Colors.teal),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
