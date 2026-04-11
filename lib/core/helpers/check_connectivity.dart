import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isOnline() async {
  final result = await Connectivity().checkConnectivity();
  return result.any((r) => r != ConnectivityResult.none);
}
