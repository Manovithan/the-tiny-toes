import 'package:apps/color.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(height * 0.50);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Schyler',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8BBD0),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                bgImage,
                height: height * 0.40,
                width: width,
                fit: BoxFit.cover,
              ),
              Container(
                height: height * 0.50,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.3, 0.8],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.white],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Text(
                " $loginString ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.3),
                    primaryColor.withOpacity(0.5)
                  ],
                ),
                border: Border(left: BorderSide(color: primaryColor, width: 5)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                prefixIcon: Icon(Icons.person, color: icons),
                labelText: "Username",
                labelStyle: TextStyle(color: primaryColor, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                prefixIcon: Icon(Icons.lock_open, color: icons),
                labelText: "Password",
                labelStyle: TextStyle(color: primaryColor, fontSize: 20),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: height * 0.08,
              width: width - 30,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor, // Set button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(30)), // Rounded corners
                  ),
                ),
                child: Text(
                  "Login to account",
                  style: TextStyle(
                    color: Colors.black, // Text color
                    fontSize: 25, // Text size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
