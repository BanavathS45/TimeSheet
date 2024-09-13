import 'package:flutter/material.dart';

class GridviewDeatils extends StatelessWidget {
  final iconKey;
  final iconData;
  const GridviewDeatils({super.key, this.iconData, this.iconKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            Text(iconKey),
          ],
        ),
      ),
    );
  }
}
