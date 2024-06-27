import 'package:clima_nova_app1/screen3.dart';
import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                shape: const CircleBorder(),
                backgroundColor: Color(0xFFD9D9D9),
              ),
              child: const Icon(Icons.arrow_back,
                  color: Colors.black), // Button icon
            ),
          ),
          title: const Text(
            'Clima Nova',
            style: TextStyle(color: Colors.white, fontFamily: 'Inder-Regular'),
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
          children: [
            SizedBox(height: 40), // Added space above the Search location bar
            Container(
              width: 328,
              height: 57,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              // Placeholder for search bar content
              child: Center(
                child: Text(
                  'Search location',
                  style: TextStyle(
                    color: Color(0xFF898989),
                    fontSize: 25,
                    fontFamily: 'Inder-Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Locate me button
            ElevatedButton(
              onPressed: () {
                //functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF363636),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Locate me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Inder-Regular',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Continue button
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screen3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF676767),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inder-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}