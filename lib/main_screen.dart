import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/search/search_screen.dart';
import 'pages/chat/chats_list_view.dart';
import 'pages/songs/number_of_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Current index of the page
  int myCurrentIndex = 0;

  // Pages List
  final List<Widget> _pages = [
    const ZionHomeScreen(),
    const ChatsUserList(),
    const Center(child: Text('Bible Page')),
    const SongsScreen(),
    const Center(child: Text('Account Page')), // ✅ Added missing page
  ];

  // Function to change the current index of the page
  void _onItemTapped(int index) {
    setState(() {
      myCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zion App',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search, color: Colors.white70, size: 30),
          ),
          IconButton(
            onPressed: () {
              showNotificationDialog(); // ✅ Fixed method call
            },
            icon: const Icon(Icons.notifications,
                color: Colors.white70, size: 30),
          ),
        ],
      ),
      body: _pages[myCurrentIndex], // ✅ Removed unnecessary Column & Expanded
      bottomNavigationBar: bottomNavigationBarSetting(),
    );
  }

  // ✅ Fixed: Changed getter to function
  void showNotificationDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications (2)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.notifications_active),
                      title: Text('New message from John'),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text('Your order has been shipped'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Bottom Navigation Bar
  Container bottomNavigationBarSetting() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.orange, width: 0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            currentIndex: myCurrentIndex,
            onTap: _onItemTapped,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_outlined),
                activeIcon: Icon(Icons.chat_outlined, size: 35),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/icons/cross.png', // ✅ Make sure this file exists
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                activeIcon: ClipOval(
                  child: Image.asset(
                    'assets/icons/cross.png',
                    width: 44.5,
                  ),
                ),
                label: 'Bible',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.music_note_outlined),
                activeIcon: Icon(Icons.music_note),
                label: 'Songs',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            iconSize: 30,
          ),
        ),
      );
}
