class Post {
  final String title;
  final int likesCount;
  final DateTime updatedTime;
  final Uri url;

  Post({this.title, this.likesCount, this.updatedTime, this.url});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      title: json['title'],
      likesCount: json['likes_count'],
      updatedTime: json['updated_at'],
      url: json['url']
    );
  }
}