import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InstagramScreen extends StatefulWidget {
  InstagramScreen({super.key});

  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 30,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: CachedNetworkImageProvider(
                      "https://i.pinimg.com/originals/83/10/ab/8310ab709f70727b92fa1a6917897c82.jpg"),
                ),
              ),
              Expanded(
                flex: 70,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      instagramDetails("Posts", "100"),
                      instagramDetails("Followers", "1M"),
                      instagramDetails("Following", "1K"),
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 40,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                    label: Text("Favirate"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 39, 61, 234),
                        foregroundColor: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 60,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.person),
                      onPressed: () {},
                      label: Text("Follow"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: isChanged,
                  onChanged: (status) {
                    setState(() {
                      isChanged = status!;
                    });
                  }),
              Text("I agree to the terms and conditions"),
            ],
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: isChanged,
            title: Text("I agree to the terms and conditions"),
            subtitle: Text("I read all tems And Condition"),
            onChanged: (status) {
              setState(() {
                isChanged = status!;
              });
            },
          )
        ],
      ),
    );
  }

  instagramDetails(String title, String count) {
    return Column(children: [
      Text(
        count,
        style: TextStyle(
            color: const Color.fromARGB(255, 87, 85, 85), fontSize: 20),
      ),
      Text(title,
          style: TextStyle(
              color: const Color.fromARGB(255, 87, 84, 84), fontSize: 20)),
    ]);
  }
}
