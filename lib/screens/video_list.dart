import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return Column(
            children: <Widget>[
              Text('Youtube Data')
            ],
          );
        },
        separatorBuilder: null,
        itemCount: null
    );
  }
}
