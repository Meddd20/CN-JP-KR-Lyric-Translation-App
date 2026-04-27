import 'package:youtube_explode_dart/youtube_explode_dart.dart';

Future<String> getYoutubeVideo(String videoId) async {
  final youtube = YoutubeExplode();
  final manifest = await youtube.videos.streamsClient.getManifest(videoId);
  final streamInfo = manifest.muxed.withHighestBitrate();
  final streamURL = streamInfo.url.toString();
  youtube.close();
  return streamURL;
}
