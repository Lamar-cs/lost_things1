

import 'package:flutter/material.dart';
import 'package:lost_things/models/post_model.dart';
import 'package:lost_things/statics/static_color.dart';
import 'package:lost_things/widgets/post_tile.dart';
class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KprimaryColor,
        title: Text("My Posts"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          return PostTile(postModel: posts[i],isme: true,);
        },
      ),
    );
  }
}
