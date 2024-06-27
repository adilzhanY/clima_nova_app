import 'package:clima_nova_app1/screen2.dart';
import 'package:flutter/material.dart';

class screen1 extends StatelessWidget {
  const screen1({super.key});

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
              TextStyle(color: Colors.white, fontFamily: 'Inder-Regular'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // See current weather button
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
                          MaterialPageRoute(builder: (context) => screen2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF303030),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('See current weather',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inder-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0)),
                    ),
                  ),

                  // See forecast button
                  Container(
                    width: 156,
                    height: 66,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF303030),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => screen2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF303030),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('See forecast',
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
            ],
          ),
        ),
      ),
    );
  }
}
