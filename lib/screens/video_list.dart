import 'package:flutter/material.dart';
import 'package:youtubeclone/models/youtube_model.dart';

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return Column(
            children: <Widget>[
              Text(youtubeData[index].title)
            ],
          );
        },
        separatorBuilder: (context, index){
          return Divider(height: 1.0);
        },
        itemCount: youtubeData.length
    );
  }
}
