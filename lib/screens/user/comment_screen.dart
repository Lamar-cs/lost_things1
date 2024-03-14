import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:lost_things/models/post_model.dart';
import 'package:lost_things/statics/static_color.dart';
import 'package:lost_things/widgets/post_tile.dart';

class CommentScreen extends StatefulWidget {
  PostModel postModel ;
   CommentScreen({required this.postModel});


  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment"),
        elevation: 0,
        backgroundColor: KprimaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          PostTile(postModel: posts[0],isme: false),
          Expanded(
            child: Container(
              child: CommentBox(
                userImage: CommentBox.commentImageParser(
                    imageURLorPath: "assets/images/photo.png"),
                child: commentChild(widget.postModel.commnets),
                labelText: 'Write a comment...',
                errorText: 'Comment cannot be blank',
                withBorder: false,
                sendButtonMethod: () {
                  if (formKey.currentState!.validate()) {
                    print(commentController.text);

                    commentController.clear();
                    FocusScope.of(context).unfocus();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: KprimaryColor,
                textColor: Colors.white,
                sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget commentChild(List<Comment> data) {
    return ListView.builder(
      itemCount:  data.length,
      itemBuilder: (context,i){
        return ListTile(
          leading: GestureDetector(
            onTap: () async {
              // Display the image in large form.
              print("Comment Clicked");
            },
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: new BoxDecoration(
                  color: Colors.brown,
                  borderRadius: new BorderRadius.all(Radius.circular(50))),
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: CommentBox.commentImageParser(
                      imageURLorPath: data[i].image)),
            ),
          ),
          title: Text(
            data[i].auther,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(data[i].comment),
          trailing: Text(data[i].time, style: TextStyle(fontSize: 10)),
        );
      },
    );
  }
}
