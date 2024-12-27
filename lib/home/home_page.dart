import 'package:flutter/material.dart';

import 'package:chat_wave_flutter/user/login_page.dart';
import 'package:chat_wave_flutter/user/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100], // 设置背景颜色
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // 设置内容周围的内边距
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 页面标题
              Text(
                '欢迎来到ChatWave',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50), // 添加空白区域
              // 横向排列的按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 登录按钮
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // 按钮颜色
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 按钮内边距
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 按钮圆角
                      ),
                    ),
                    child: const Text(
                      '登录',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 20), // 按钮之间的间隔
                  // 注册按钮
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // 按钮颜色
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 按钮内边距
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 按钮圆角
                      ),
                    ),
                    child: const Text(
                      '注册',
                      style: TextStyle(fontSize: 18),
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
