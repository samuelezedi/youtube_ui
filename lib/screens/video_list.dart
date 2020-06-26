import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class VideoList extends StatelessWidget {

  final listData;

  const VideoList({this.listData});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                width: width,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(listData[index].thumbNail),
                        fit: BoxFit.cover)),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listData[index].channelAvatar),
                ),
                title: Text(listData[index].title, style: TextStyle(),),
                subtitle: Text("${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}"),
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1.0);
        },
        itemCount: listData.length);
  }
}
