import 'package:chat_wave_flutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: Column(
        children: [
          Center(
            child: Text('message Page'),
          ),
        ],
      ),
    );
  }
}