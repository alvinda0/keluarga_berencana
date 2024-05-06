import 'package:flutter/material.dart';
import 'package:keluarga_berencana/ChooseKBPage.dart';
import 'package:keluarga_berencana/ReminderPage.dart';
import 'package:keluarga_berencana/profile_page.dart';
import 'package:keluarga_berencana/home_page.dart';
import 'package:keluarga_berencana/screen/splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String userId;

  DashboardScreen({
    required this.userId,
  });

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(
      userId: '',
      username: '',
      email: '',
      fullName: '',
      placeOfBirth: '',
      address: '',
      phoneNumber: '',
    ), // Mengirim userId ke ProfilePage
    ChooseKBPage(),
    ReminderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KB'),
        // Menampilkan nama userId di dalam app bar
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              'User: ${widget.userId}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout), // Icon logout
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MySplashScreen(),
                ), // Pindah ke SplashScreen
              );
            },
          ),
        ],
        automaticallyImplyLeading: false, // Menyembunyikan tombol kembali
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.blue, // Mengatur warna latar belakang
        selectedItemColor:
            Colors.blue, // Mengatur warna ikon terpilih menjadi biru
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informasi KB',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Atur penjadwalan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Pengingat',
          ),
        ],
      ),
    );
  }
}
