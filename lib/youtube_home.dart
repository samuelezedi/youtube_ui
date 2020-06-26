import 'package:flutter/material.dart';
import 'package:youtubeclone/screens/home.dart';

class YoutubeHome extends StatefulWidget {
  @override
  _YoutubeHomeState createState() => _YoutubeHomeState();
}

class _YoutubeHomeState extends State<YoutubeHome> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  initState (){
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();

  }
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    List<Widget> screens = [
      HomeScreen(),
      Center(
        child: Text('Trending'),
      ),
      Center(
        child: Text('Subscriptions'),
      ),
      Center(
        child: Text('Inbox'),
      ),
      Center(
        child: Text('Library'),
      ),
    ];

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
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child){
          return Transform(
            transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
            child: screens[_currentIndex],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(
                title: Text('Home'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text('Trending'), icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                title: Text('Subscriptions'), icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                title: Text('Inbox'), icon: Icon(Icons.mail)),
            BottomNavigationBarItem(
                title: Text('Library'), icon: Icon(Icons.folder)),
          ]),
    );
  }
}
