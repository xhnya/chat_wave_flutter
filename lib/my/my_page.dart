import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: Column(
        children: [
          Center(
            child: Text('我的 Page'),
          ),
          ElevatedButton(onPressed: () {
            //退出登录
            SharedPreferences.getInstance().then((value) => value.setBool('isLoggedIn', false));
            //跳转到home_page
            //
            Get.offAllNamed('/');
          }, child: Text('退出登录'))
        ],
      ),
    );
  }
}