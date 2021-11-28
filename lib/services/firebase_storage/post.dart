import 'dart:convert';

class Post {
  String id;
  String userId;
  String comment;
  String imageUrl;
  String profileimage;
  String username;
  int likes;
  Post({
    this.id,
    this.userId,
    this.comment,
    this.imageUrl,
    this.profileimage,
    this.username,
    this.likes,
  });

  Post copyWith({
    String id,
    String userId,
    String comment,
    String imageUrl,
    String profileimage,
    String username,
    int lkes,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      comment: comment ?? this.comment,
      imageUrl: imageUrl ?? this.imageUrl,
      profileimage: profileimage ?? this.profileimage,
      username: username ?? this.username,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'comment': comment,
      'imageUrl': imageUrl,
      'profileimage': profileimage,
      'username': username,
      'likes': likes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      userId: map['userId'],
      comment: map['comment'],
      imageUrl: map['imageUrl'],
      profileimage: map['profileimage'],
      username: map['username'],
      likes: map['likes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, comment: $comment, imageUrl: $imageUrl, profileimage: $profileimage, username: $username, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.id == id &&
      other.userId == userId &&
      other.comment == comment &&
      other.imageUrl == imageUrl &&
      other.profileimage == profileimage &&
      other.username == username &&
      other.likes == likes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      comment.hashCode ^
      imageUrl.hashCode ^
      profileimage.hashCode ^
      username.hashCode ^
      likes.hashCode;
  }
}
