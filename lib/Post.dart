class Post {
  final String title;
  final int likesCount;
  final String updatedTimeString;
  final String urlString;
  final User user;

  Post({this.title, this.likesCount, this.updatedTimeString, this.urlString, this.user});

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
      urlString: json['url'],
      user: new User.fromJson(json['user'])
    );
  }
}

class User {
  final String id;
  final String profileImageUrl;

  User({this.id, this.profileImageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      id: json['id'],
      profileImageUrl: json['profile_image_url']
    );
  }
}