import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListViewDeatils extends StatelessWidget {
  final String title, imgLogo;
  const ListViewDeatils({super.key, this.title = "", this.imgLogo = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Card(
            child: CachedNetworkImage(
                width: double.infinity, height: 200, imageUrl: imgLogo),
          )
        ],
      ),
    );
  }
}
