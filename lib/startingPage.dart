import 'package:clima_nova_app1/searchLocationPage.dart';
import 'package:flutter/material.dart';

class startingPage extends StatelessWidget {
  const startingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            title: const Text(
              'Clima Nova',
              style:
              TextStyle(color: Colors.white, fontFamily: 'Inder-Regular', fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF303030),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color(0xFF343434)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main page image
              Container(
                width: 260,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/main_page_image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 24), // Spacer between image and text

              // Text: Explore the world's weather with just a tap
              SizedBox(
                width: 328,
                child: Text(
                  "Explore the world's weather with just a tap",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Inder-Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 24), // Spacer between text and buttons

              // Row containing buttons
              Container(
                width: 156,
                height: 66,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF303030),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF303030),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('See weather',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inder-Regular',
                          fontWeight: FontWeight.w400,
                          height: 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
