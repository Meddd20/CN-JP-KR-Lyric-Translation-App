import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String? getYoutubeId(String youtubeURL) {
  return YoutubePlayer.convertUrlToId(youtubeURL);
}
