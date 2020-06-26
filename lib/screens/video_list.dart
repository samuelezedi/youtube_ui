import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class VideoList extends StatelessWidget {
  final listData;

  const VideoList({this.listData});

  @override
  Widget build(BuildContext context) {
    var deviceOrientation = MediaQuery.of(context).orientation;

    var width = MediaQuery.of(context).size.width;

    return ListView.separated(
        itemBuilder: (context, index) {
          if (deviceOrientation == Orientation.portrait) {
            return _buildPortraitList(context, index, width);
          } else {
            return _buildLandscapeList(context, index, width);
          }
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1.0);
        },
        itemCount: listData.length);
  }

  Widget _buildPortraitList(context, index, width) {
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
            child: Text(
              listData[index].title,
              style: TextStyle(),
            ),
          ),
          subtitle: Text(
              "${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}"),
          trailing: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: IconButton(
              icon: Icon(Icons.more_vert),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLandscapeList(context, index, width) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 336 / 2,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(listData[index].thumbNail),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      listData[index].title,
                      style: TextStyle(),
                    ),
                  ),
                  subtitle: Text(
                      "${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}"),
                  trailing: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: IconButton(
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      listData[index].channelAvatar,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
