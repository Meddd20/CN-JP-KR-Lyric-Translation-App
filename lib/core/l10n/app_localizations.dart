import 'package:Versalex/core/enums/app_languages.dart';

class AppLocalizations {
  final AppLanguage language;

  const AppLocalizations(this.language);

  bool get _isEn => language == AppLanguage.en;

  String _t(String en, String id) => _isEn ? en : id;

  // Navigation
  String get navHome => _t('Discover', 'Temukan');
  String get navHistory => _t('My Songs', 'Lagu Saya');
  String get navVocabulary => _t('Vocabulary', 'Kosakata');

  // Home Page
  String get transcribeYourSongs => _t('Transcribe your Songs', 'Pelajari dari Lagu Favoritmu');
  String get chineseJapaneseKorean => _t('Chinese, Japanese, and Korean', 'Mandarin, Jepang, dan Korea');
  String get recentSessions => _t('Recent Generated', 'Baru Diproses');
  String get viewAll => _t('View All', 'Lihat Semua');
  String get generate => _t('Generate', 'Mulai');

  // History Page
  String get searchByTitleOrArtist => _t('Search by title or artist...', 'Cari berdasarkan judul atau artis...');
  String get allLessons => _t('All Lessons', 'Semua');
  String get mandarin => _t('Mandarin', 'Mandarin');
  String get japanese => _t('Japanese', 'Jepang');
  String get korean => _t('Korean', 'Korea');
  String get noSongsSavedYet => _t('No songs saved yet', 'Belum ada lagu tersimpan');
  String get pasteYoutubeUrlToStart => _t(
        'Paste a YouTube URL on the home page to get started',
        'Masukkan link YouTube untuk mulai menganalisis lagu',
      );
  String get deleteSong => _t('Delete Song?', 'Hapus lagu ini?');
  String get deleteWarning => _t(
        'This will also remove all saved vocabulary from this song.',
        'Kosakata yang sudah kamu simpan dari lagu ini juga akan ikut terhapus.',
      );
  String get delete => _t('Delete', 'Hapus');
  String get cancel => _t('Cancel', 'Batal');
  String get errorPrefix => _t('Error: ', 'Ups, ada error: ');

  // Lyric Detail Page
  String get noInternetConnection => _t('No internet connection', 'Tidak ada koneksi internet');
  String get songGlossary => _t('Song Glossary', 'Kosakata di Lagu Ini');
  String get uniqueWords => _t('unique words', 'kata unik');
  String get words => _t('words', 'kata');
  String get analyzingPhrase => _t('Analyzing Phrase', 'Bedah Lirik');
  String get tapToSaveKeyword => _t(
        'Tap to save keyword you find interesting',
        'Ketuk kata yang ingin kamu simpan',
      );

  // Vocabulary Page
  String get collection => _t('Collection', 'Koleksi');
  String get savedVocabulary => _t('Saved Vocabulary', 'Kata yang Kamu Simpan');
  String get noVocabSavedYet => _t('No vocabulary saved yet', 'Belum ada kosakata tersimpan');
  String get saveWordsFromLyrics => _t(
        'Save words from lyrics to see them here',
        'Simpan kata dari lirik lagu untuk dipelajari di sini',
      );

  // Vocabulary Detail Page
  String get collectionLabel => _t('COLLECTION', 'KOLEKSI');
  String get yourPersonalCollection => _t(
        'Your personal collection of words discovered from song lyrics.',
        'Kumpulan kata yang kamu temukan dan simpan dari lirik lagu.',
      );
  String get searchYourVocabulary => _t('Search your vocabulary', 'Cari kata...');
  String get savedWords => _t('Saved Words', 'Kata Tersimpan');
  String showingTerms(int count) => _t('Showing $count terms', 'Menampilkan $count kata');
  String get sortLatest => _t('Latest', 'Terbaru');
  String get sortOldest => _t('Oldest', 'Terlama');
  String get sortAscending => _t('Ascending (A → Z)', 'A ke Z');
  String get sortDescending => _t('Descending (Z → A)', 'Z ke A');
}
