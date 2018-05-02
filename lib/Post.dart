class Post {
  final String title;
  final int likesCount;
  final String updatedTimeString;
  final String urlString;

  Post({this.title, this.likesCount, this.updatedTimeString, this.urlString});

  DateTime get updatedTime => DateTime.parse(updatedTimeString);

  // TODO: abstract
  // Post(Map<String, dynamic> json)
  //   : title = json['title'],
  //   super(json);

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      title: json['title'],
      likesCount: json['likes_count'],
      updatedTimeString: json['updated_at'],
      urlString: json['url']
    );
  }
}