import 'package:apps/gallery2.dart';
import 'package:apps/storage_service.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'color.dart';

class GalleryPage extends StatefulWidget {
  final String title;
  final String userName;

  const GalleryPage({Key? key, required this.title, required this.userName})
      : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String? username;

  @override
  void initState() {
    fetchfunction();

    super.initState();
  }

  fetchfunction() async {
    username = await StorageService().getUsername();
    print("aaaaaaaa${username}");
    setState(() {
      username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login_page()),
                  (route) => false,
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
              'Gallery',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  username ?? 'user',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
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

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCustomAppBar(context),
          Center(
            child: Text(
              ' ${widget.title}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GalleryApp()),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.image, color: Colors.blue),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        index % 2 == 0
                            ? 'accusamus'
                            : index % 3 == 0
                                ? 'officia'
                                : 'reprehens',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
