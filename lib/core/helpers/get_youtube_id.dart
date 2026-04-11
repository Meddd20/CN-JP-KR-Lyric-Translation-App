import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String getYoutubeThumbnail(String youtubeURL) {
  final videoId = YoutubePlayer.convertUrlToId(youtubeURL);
  if (videoId == null) return "";
  return "https://img.youtube.com/vi/$videoId/maxresdefault.jpg";
}

String getYoutubeThumbnailFallback(String youtubeURL) {
  final videoId = YoutubePlayer.convertUrlToId(youtubeURL);
  if (videoId == null) return "";
  return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
}
