import 'package:flutter/material.dart';
import 'TerbaruPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  List<Widget> _pages = [
    TerbaruPage(),
    // DaerahPage(),
    // InternasionalPage(),
    // IslamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
          CircleAvatar(
          backgroundImage: AssetImage('https://static.republika.co.id/files/images/logo.png'),
          radius: 50,
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TerbaruPage()),
            );
          },
          child: Text(
            "Terbaru",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
              padding:
                EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}