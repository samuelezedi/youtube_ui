import 'package:flutter/material.dart';

class YoutubeHome extends StatefulWidget {
  @override
  _YoutubeHomeState createState() => _YoutubeHomeState();
}

class _YoutubeHomeState extends State<YoutubeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          'assets/images/youtube_logo.png',
          width: 98.0,
          height: 22.0,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text('Trending'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text('Subscriptions'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text('Inbox'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text('Library'), icon: Icon(Icons.home)),
      ]),
    );
  }
}
