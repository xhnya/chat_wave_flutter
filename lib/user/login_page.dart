import 'package:chat_wave_flutter/message/message_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 控制器，用于获取用户输入的账号和密码
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 用于表单验证
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 模拟登录验证
  void _login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      // 获取账号和密码
      String username = _usernameController.text;
      String password = _passwordController.text;

      // 在这里你可以加入实际的登录验证逻辑
      bool loginSuccess = (username == 'user' && password == 'password'); // 这里使用简单的验证，实际使用时应该连接后端验证

      if (loginSuccess) {
        // 登录成功，保存状态
        var value = await SharedPreferences.getInstance();
        value.setBool('isLoggedIn', true);

        // 登录成功，跳转到首页
        Get.offAndToNamed("/"); // 你可以替换为其他页面
      } else {
        // 登录失败时，弹出提示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed! Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to My App',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                // 使用Form包裹输入框，进行表单验证
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // 用户名输入框
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // 密码输入框
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true, // 隐藏密码
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // 登录按钮
                      ElevatedButton(
                        onPressed: () => _login(context),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
