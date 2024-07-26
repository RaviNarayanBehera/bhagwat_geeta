import 'dart:async';
import 'package:bhagwat_geeta/view/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return const Scaffold(
      backgroundColor: Color(0xffb20202),
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/1.png'),
              backgroundColor: Color(0xfffcc94a),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '|| श्रीमद् भगवत् गीता  ||',
            style: TextStyle(
                color: Color(0xfffcc94a), fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
