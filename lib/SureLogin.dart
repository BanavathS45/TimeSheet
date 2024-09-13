import 'package:flutter/material.dart';

class SureLogin extends StatefulWidget {
  const SureLogin({super.key});

  @override
  State<SureLogin> createState() => _SureLoginState();
}

class _SureLoginState extends State<SureLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height:
              double.infinity, // Ensure the container takes up the full screen
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Login.png'), // Add your image path here
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 -
              10, // Center the text vertically
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Login".toUpperCase(),
              style: TextStyle(
                color: const Color.fromARGB(255, 6, 1, 169),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto', // Use your custom font family here
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 80.0,
          left: 15.0,
          right: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Make form fields take full width
              children: [
                Form(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Username',
                            ),
                          ),

                          // Add spacing between fields
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              // Add your login logic here
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
