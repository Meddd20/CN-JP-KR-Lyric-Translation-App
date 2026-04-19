import 'package:Versalex/core/databases/isar_provider.dart';
import 'package:Versalex/core/databases/models/saved_keyword_entity.dart';
import 'package:Versalex/core/databases/models/song_lyric_entity.dart';
import 'package:Versalex/core/router/app_router.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await dotenv.load(fileName: ".env");

  final prefs = await SharedPreferences.getInstance();

  // Buka database Isar — kalau belum ada, Isar buat file baru
  // SongLyricEntitySchema = struktur tabel yang digenerate dari @collection
  // directory = lokasi file .isar disimpan di device
  final isar = await Isar.open(
    [SongLyricEntitySchema, SavedKeywordEntitySchema],
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      // isarProvider aslinya cuma placeholder (throw UnimplementedError)
      // di sini kita replace dengan instance Isar yang sudah dibuat di atas
      // sehingga repository yang inject isarProvider dapat instance yang sama
      overrides: [
        isarProvider.overrideWithValue(isar),
        // sharedpreferepro.overrideWithValue(AsyncValue.data(prefs)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CNJPKR',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
