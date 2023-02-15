import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Image.asset('images/profile.png'),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('TEXT'),
          ),
        ],
      ),
    );
  }
}
