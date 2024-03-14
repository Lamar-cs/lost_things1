import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:lost_things/functions/get_size.dart';
import 'package:lost_things/models/post_model.dart';
import 'package:lost_things/statics/static_color.dart';

import '../screens/user/comment_screen.dart';

class PostTile extends StatelessWidget {
  PostModel postModel;
  bool isme;
   PostTile({
     required this.isme,
    required this.postModel
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration:
        BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        width: GetSize.getWidth(context),
        //decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5,left: 10,top: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orange,
                  ),
                  SizedBox(width: 10),
                  Text(postModel.auther),
                  Spacer(),

                  isme? IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)):SizedBox()

                ],
              ),
            ),
            SizedBox(
              // width: GetSize.getWidth(context) * .96,
              // height: GetSize.getHight(context) * .22,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Align(child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(postModel.caption,style: TextStyle(fontSize: 16),),
                    ),alignment: Alignment.centerLeft,),
                    SizedBox(height: 5),
                    Image.asset(
                      postModel.image,
                      fit: BoxFit.fill,
                      width: GetSize.getWidth(context) * .96,
                      height: GetSize.getHight(context) * .19,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CommentScreen(postModel: postModel);
                    }));
                  },
                  icon: Icon(Icons.comment),
                ),
                LikeButton(

                  size: 20,
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    if (isLiked){
                      postModel.numoflikes+=1;
                    }
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? KsecondColor : Colors.grey,
                      size: 30,
                    );
                  },
                  likeCount: postModel.numoflikes,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}