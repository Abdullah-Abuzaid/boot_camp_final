import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String kInstgramLogo = "assets/svgs/logo.svg";
final String kInstgramLogoLarge = "assets/svgs/logo.svg";
final String kHeart = "assets/svgs/heart.svg";
final String kAdd = "assets/svgs/add.svg";
final String kMessengar = "assets/svgs/messenger.svg";
final String kShare = "assets/svgs/share.svg";
final String kChat = "assets/svgs/comment.svg";
final String kBookmark = "assets/svgs/bookmark.svg";
final String kSearch = "assets/svgs/search.svg";
final String kHome = "assets/svgs/Home.svg";
final String kReels = "assets/svgs/reels.svg";
final String kShop = "assets/svgs/shop.svg";
final String kMore = "assets/svgs/more.svg";
final String kSeries = "assets/svgs/series.svg";

Widget SvgCreator(String iconString, {double width = 60, double height = 60.0}) {
  return SvgPicture.asset(
    iconString,
    width: width,
    height: height,
  );
}
