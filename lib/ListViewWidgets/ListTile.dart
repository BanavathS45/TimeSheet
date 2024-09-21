import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/ListViewWidgets/LIstViewDetails.dart';

class ListViewTile extends StatefulWidget {
  ListViewTile({super.key});

  @override
  State<ListViewTile> createState() => _ListViewTileState();
}

class _ListViewTileState extends State<ListViewTile> {
  List<String> frameWorksList = ["React", "Angular", "Flutter"];
  List<String> imgUrl = [
    "https://th.bing.com/th/id/R.f81a6f373c244b1f70f4b7402b5ab372?rik=rbXh4ieLuKt%2bmA&riu=http%3a%2f%2flogos-download.com%2fwp-content%2fuploads%2f2016%2f09%2fReact_logo_logotype_emblem.png&ehk=QhGOkKcUKCU7FBQgHOajOiJqJBACUTD2Ni6LsfqzCEA%3d&risl=&pid=ImgRaw&r=0",
    // "https://th.bing.com/th/id/R.f81a6f373c244b1f70f4b7402b5ab372?rik=rbXh4ieLuKt%2bmA&riu=http%3a%2f%2flogos-download.com%2fwp-content%2fuploads%2f2016%2f09%2fReact_logo_logotype_emblem.png&ehk=QhGOkKcUKCU7FBQgHOajOiJqJBACUTD2Ni6LsfqzCEA%3d&risl=&pid=ImgRaw&r=0",
    "https://freepngdesign.com/content/uploads/images/p-1699-5-angular-icon-logo-png-transparent-logo-473615905138.png",
    "https://seekicon.com/free-icon-download/flutter_2.png"
  ];
  String defaultImg =
      "https://th.bing.com/th/id/OIP.esdHnlB-eysViOsi0G_x9QHaEo?w=269&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7";
  // imgUrl

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: ListView(
        //   padding: EdgeInsets.all(10.0),
        //   children: [
        //     myContainer(bgColor: Colors.blue, titles: "Prashanth"),
        //   ],
        // ),

        body: ListView.builder(
      itemCount: frameWorksList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => taps(
                          title: frameWorksList[index],
                          imgLogo: imgUrl[index])));
            },
            leading: CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: imgUrl[index] ?? defaultImg,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            title: Text(frameWorksList[index]),
            subtitle: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Click Here About ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: frameWorksList[index].toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
