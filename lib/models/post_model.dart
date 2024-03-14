class PostModel {
  final String caption;
  final String image;
  final String auther;
   int numoflikes;
  final List<Comment> commnets;

  PostModel(
      {required this.caption,
      required this.image,
      required this.auther,
      required this.numoflikes,
      required this.commnets});
}

class Comment {
  final String comment;
  final String auther;
  final String time;
  final String image;

  Comment({required this.comment, required this.auther, required this.time,required this.image});
}

List<PostModel> posts = [
  PostModel(
    caption: 'phone losted at 2:30pm in a-2-22 lab',
    image: "assets/images/phone.png",
    auther: 'Sara',
    numoflikes: 10,
    commnets: [
      Comment(
        time: '1h',
        auther: 'Reema',
        comment: 'up',
        image: 'assets/images/photo.png.jpg'
      ),
      Comment(
        time: '1h',
        auther: 'Arwa',
        comment: 'up',
          image: 'assets/images/photo.png.jpg'
      ),
      Comment(
        time: '2h',
        auther: 'Alia',
        comment: 'yep, this phone is for me thank you',
          image: 'assets/images/photo.png.jpg'
      ),
    ],
  ),
  PostModel(
    caption: 'Airpods losted at 2:30pm in a-3-36',
    image: "assets/images/airpod.png",
    auther: 'Deema',
    numoflikes: 10,
    commnets: [
      Comment(
          time: '1h',
          auther: 'sara',
          comment: 'up',
          image: 'assets/images/photo.png.jpg'
      ),
      Comment(
        image: 'assets/images/photo.png.jpg',
        time: '1h',
        auther: 'Rama',
        comment: 'yep, this phone is for me thank you',
      ),
    ],
  ),
  PostModel(
    caption: 'سماعة بلوتوث مفقودة في مبنى علوم الحاسب , بالقرب من قاعات العملي',
    image: "assets/images/bag.png",
    auther: 'سديم',
    numoflikes: 10,
    commnets: [
      Comment(
          time: '50s',
          auther: 'أميرة',
          comment: 'رفع',
          image: 'assets/images/photo.png.jpg'
      ),
      Comment(
        image: 'assets/images/photo.png.jpg',
        time: '20m',
        auther: 'عائشة',
        comment: 'رفع',
      ),

      Comment(
          time: '1h',
          auther: 'سوزان',
          comment: 'نعم انها لي , سوف اتواصل معك شكرا لك',
          image: 'assets/images/photo.png.jpg'
      ),
    ],
  ),
];
