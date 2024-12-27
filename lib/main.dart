import 'package:chat_wave_flutter/contacts/contacts_page.dart';
import 'package:chat_wave_flutter/home/home_page.dart';
import 'package:chat_wave_flutter/my/my_page.dart';
import 'package:chat_wave_flutter/user/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'message/message_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your desired primary color here
      ),
      home: const HomeScreen(),
      initialRoute: '/',
      getPages: [
        // 定义所有路由
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/message', page: () => const MessagePage()),
        GetPage(name: '/contacts', page: () => const ContactsPage()),
        GetPage(name: '/my', page: () => const MyPage()),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MessagePage(),
    ContactsPage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!mounted) return;

    if (isLoggedIn) {

    } else {
      Get.offNamed('/home');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        title: const Text('ChatWave'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: '联系人',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,  // 使用主题中的 primaryColor
        onTap: _onItemTapped,
      ),
    );
  }
}
