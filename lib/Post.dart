class Post {
  final String title;
  // final int likesCount;
  // final DateTime updatedTime;
  // final Uri url;

  Post({this.title});
  // Post({this.title, this.likesCount, this.updatedTime, this.url});

  // TODO: abstract
  // Post(Map<String, dynamic> json)
  //   : title = json['title'],
  //   super(json);

  factory Post.fromJson(Map<String, dynamic> json) {
    // print(json['title']);
    return new Post(
      title: json['title'],
      // likesCount: json['likes_count'],
      // updatedTime: json['updated_at'],
      // url: json['url']
    );
  }
}