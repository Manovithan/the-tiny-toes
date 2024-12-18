import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'color.dart'; 
import 'login.dart'; 
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
  List<String> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          users = data.take(10).map<String>((user) => user['name']).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildCustomAppBar(context),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildUserList(),
          ),
        ],
      ),
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: appBar, 
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          GestureDetector(
            onTap: () {
              
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

          
          const Text(
            'Users',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          
          const Row(
            children: [
              SizedBox(width: 10), 
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
              ),
            ],
          ),
        ],
      ),
    );
  }

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
    
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumPage(userName: users[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
