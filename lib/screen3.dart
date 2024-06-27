import 'package:flutter/material.dart';

class screen3 extends StatelessWidget {
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
                Navigator.pop(context); // Navigate back to screen2
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
      ),
    );
  }
}
