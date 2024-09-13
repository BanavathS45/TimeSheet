import 'package:flutter/material.dart';
import 'package:flutter_basic_app/ListViewWidgets/GirdViewDeatils.dart';

class GridViews extends StatefulWidget {
  const GridViews({super.key});

  @override
  State<GridViews> createState() => _GridViewsState();
}

final List<String> gridIcons = ["home", "person", "video", "arrow_back"];
final Map<String, IconData> iconMap = {
  "home": Icons.home,
  "person": Icons.person,
  "video": Icons.video_collection,
  "arrow_back": Icons.arrow_back,
};

class _GridViewsState extends State<GridViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: gridIcons.length, // Use the length of the gridIcons list
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items per row
          crossAxisSpacing: 8.0, // Space between columns
          mainAxisSpacing: 8.0, // Space between rows
        ),
        itemBuilder: (ctx, index) {
          // Get the icon key from the gridIcons list
          String iconKey = gridIcons[index % gridIcons.length];
          // Get the icon data from the iconMap
          IconData iconData = iconMap[iconKey] ?? Icons.error; // Fallback icon
          return InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Container(
                        width: double.infinity,
                        height: 200.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(iconData), Text(iconKey)],
                          ),
                        ),
                      );
                    });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (ctx) => GridviewDeatils(
                //     iconKey: iconKey,
                //     iconData: iconData,

                //   )),
                // );
              },
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(iconData),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Text(iconKey),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
