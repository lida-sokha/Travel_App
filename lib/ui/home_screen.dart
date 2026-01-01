import 'package:flutter/material.dart';

const String homepapge = 'assets/images/homepage.jpg';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel App')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Image.asset(homepapge, fit: BoxFit.cover),
          ),
          Container(
            
          )
        ],
      ),
    );
  }
}
