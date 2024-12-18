import 'package:flutter/material.dart';
import 'login.dart'; // Import the Login Page
import 'color.dart'; 

class AlbumPage extends StatelessWidget {
  final String userName;

  const AlbumPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildCustomAppBar(context), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    '$userName\'s Albums',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildListItem("Q", "quidem molestiae"),
                        _buildListItem("S", "sunt qui excepturi"),
                        _buildListItem("O", "omnis laborum"),
                        _buildListItem("N", "non esse culpa .."),
                        _buildListItem("E", "eaque aut omnis a"),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
            'Albums',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
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

  Widget _buildListItem(String letter, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300, 
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade400, 
                width: 1, 
              ),
            ),
            padding: const EdgeInsets.all(2.0), 
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade400, 
              child: Text(
                letter,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5), 

          
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300, 
                borderRadius: BorderRadius.circular(50), 
                border: Border.all(
                  color: Colors.grey.shade400, 
                  width: 1, 
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
