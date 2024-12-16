import 'package:flutter/material.dart';
import 'color.dart'; // Custom colors
import 'login.dart'; // Login page
import 'constants.dart';
import 'album.dart';

void main() {
  runApp(const UsersPage());
}

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Page',
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
      ),
      home: const UserPage(),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // List of user names
  final List<String> users = [
    'Manovithan',
    'Milan',
    'Lena ',
    'Nelson',
    'Lee',
    'Bell',
    'Jayson ',
    'Jake',
    'Analia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildCustomAppBar(context),
          Expanded(child: _buildUserList())
        ],
      ),
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: appBar, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2), // Shadow under the app bar
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logout Button on the Left
          GestureDetector(
            onTap: () {
              // Navigate to login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login_page()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Title in the Center
          const Text(
            'Users',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // User Profile Icon with Text on the Right
          const Row(
            children: [
              SizedBox(width: 10), // Space between icon and text
              Text(
                'User',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 28,
                weight: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // User List widget
  Widget _buildUserList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              users[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              // Navigate to the album page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Albumpage(userName: users[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

