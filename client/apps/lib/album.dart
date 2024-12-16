import 'package:flutter/material.dart';

class Albumpage extends StatefulWidget {
  const Albumpage({super.key, required String userName});

  @override
  State<Albumpage> createState() => _AlbumpageState();
}

class _AlbumpageState extends State<Albumpage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
/* Album Page
class AlbumPage extends StatelessWidget {
  final String userName;

  const AlbumPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$userName\'s Albums',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text(
          'Welcome to $userName\'s Albums!',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}*/
