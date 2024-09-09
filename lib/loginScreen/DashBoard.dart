import 'package:flutter/material.dart';

class DashBorad extends StatefulWidget {
  final String message;

  // Constructor to accept the message
  DashBorad({required this.message});
  @override
  State<DashBorad> createState() => _DashBoradState();
}

class _DashBoradState extends State<DashBorad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                // color: Colors.limeAccent.withOpacity(0.7), // Optional overlay
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/basic.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                'SureCare',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Your Health, Our Priority',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10),

                    SizedBox(height: 15),
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "widget.message,",
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
              Container(
                height: 350,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    // First Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                          icon: Icon(Icons.home),
                          label: Text('Patient Login'),
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              backgroundColor:
                                  (Color.fromARGB(255, 14, 28, 52)),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              textStyle:
                                  TextStyle(color: Colors.pink) // Button color
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Second Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                          icon: Icon(Icons.health_and_safety),
                          label: Text('Doctor Login'),
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            backgroundColor: (Color.fromARGB(255, 0, 255, 123)),
                            foregroundColor:
                                Color.fromARGB(255, 52, 35, 35), // Button color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Third Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print(
                                    'Setting clicked'); // Add your onPressed code here!
                              },
                              icon: Icon(Icons.settings),
                              label: Text('Provider Login'),
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                backgroundColor:
                                    (Color.fromARGB(255, 46, 50, 48)),
                                foregroundColor: const Color.fromARGB(
                                    255, 255, 255, 255), // Button color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 55.0, vertical: 25.0),
                child: Container(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      children: const [
                        TextSpan(
                            text: 'This is the beginning of the sentence, '),
                        TextSpan(
                          text: 'this part is bold',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(235, 255, 255, 255)),
                        ),
                        TextSpan(
                            text: ', and this is the end of the sentence.'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
//cached_network_image
//flutter_launcher_icons
//google_fonts