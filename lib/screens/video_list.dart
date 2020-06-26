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
                contentPadding: EdgeInsets.all(10),
                dense: true,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listData[index].channelAvatar),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(listData[index].title, style: TextStyle(),),
                ),
                subtitle: Text("${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}"),
                trailing: Container(
                  margin: EdgeInsets.only(bottom:20),
                  child: IconButton(
                    icon: Icon(Icons.more_vert),
                  ),
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
