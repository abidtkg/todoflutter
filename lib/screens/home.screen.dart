import 'package:flutter/material.dart';
import 'package:todoapp/screens/profile.screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text('Learn More'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const ProfilePage();
            },
          ),
        );
      },
    ));
  }
}
