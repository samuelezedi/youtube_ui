import 'package:flutter/material.dart';
import 'package:youtubeclone/models/youtube_model.dart';
import 'package:youtubeclone/screens/video_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VideoList(listData: youtubeData,);
  }
}
