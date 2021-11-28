import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppUser {
  List<String> following;
  List<String> followers;
  String pio;
  String id;
  String profilePhoto;
  String username;
  AppUser({
    this.following,
    this.followers,
    this.pio,
    this.id,
    this.profilePhoto,
    this.username,
  });

  AppUser copyWith({
    List<String> following,
    List<String> followers,
    String pio,
    String id,
    String profilePhoto,
    String username,
  }) {
    return AppUser(
      following: following ?? this.following,
      followers: followers ?? this.followers,
      pio: pio ?? this.pio,
      id: id ?? this.id,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'following': following,
      'followers': followers,
      'pio': pio,
      'id': id,
      'profilePhoto': profilePhoto,
      'username': username,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      following: List<String>.from(map['following']),
      followers: List<String>.from(map['followers']),
      pio: map['pio'],
      id: map['id'],
      profilePhoto: map['profilePhoto'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(following: $following, followers: $followers, pio: $pio, id: $id, profilePhoto: $profilePhoto, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AppUser &&
      listEquals(other.following, following) &&
      listEquals(other.followers, followers) &&
      other.pio == pio &&
      other.id == id &&
      other.profilePhoto == profilePhoto &&
      other.username == username;
  }

  @override
  int get hashCode {
    return following.hashCode ^
      followers.hashCode ^
      pio.hashCode ^
      id.hashCode ^
      profilePhoto.hashCode ^
      username.hashCode;
  }
}
