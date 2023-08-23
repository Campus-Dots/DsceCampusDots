import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Campus Dots'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              icon: const Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: const Text('logout'))
        ],
      ),
      body: CarouselSlider(
        // This widget shows the sliding images
        items: [
          // These images below are place holders. Add whatever Images you like
          Image.asset(
            'lib/assets/Placeholder1.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'lib/assets/Placeholder2.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'lib/assets/Placeholder3.jpg',
            fit: BoxFit.cover,
          ),
        ],
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            viewportFraction: 0.7),
      ),
    );
  }
}
