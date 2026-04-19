import 'package:Versalex/core/enums/app_languages.dart';

class AppLocalizations {
  final AppLanguage language;

  const AppLocalizations(this.language);

  bool get _isEn => language == AppLanguage.en;

  String _t(String en, String id) => _isEn ? en : id;

  // Navigation
  String get navHome => _t('Home', 'Beranda');
  String get navHistory => _t('History', 'Riwayat');
  String get navVocabulary => _t('Vocabulary', 'Kosakata');

  // Home Page
  String get transcribeYourSongs => _t('Transcribe your Songs', 'Transkripsi Lagu Kamu');
  String get chineseJapaneseKorean => _t('Chinese, Japanese, and Korean', 'Mandarin, Jepang, dan Korea');
  String get recentSessions => _t('Recent Sessions', 'Sesi Terakhir');
  String get viewAll => _t('View All', 'Lihat Semua');
  String get generate => _t('Generate', 'Proses');

  // History Page
  String get searchByTitleOrArtist =>
      _t('Search by title or artist...', 'Cari judul atau artis...');
  String get allLessons => _t('All Lessons', 'Semua');
  String get mandarin => _t('Mandarin', 'Mandarin');
  String get japanese => _t('Japanese', 'Jepang');
  String get korean => _t('Korean', 'Korea');
  String get noSongsSavedYet => _t('No songs saved yet', 'Belum ada lagu tersimpan');
  String get pasteYoutubeUrlToStart => _t(
    'Paste a YouTube URL on the home page to get started',
    'Tempel URL YouTube di halaman utama untuk mulai',
  );
  String get deleteSong => _t('Delete Song?', 'Hapus Lagu?');
  String get deleteWarning => _t(
    'This will also remove all saved vocabulary from this song.',
    'Kosakata yang tersimpan dari lagu ini juga akan ikut terhapus.',
  );
  String get delete => _t('Delete', 'Hapus');
  String get cancel => _t('Cancel', 'Batal');
  String get errorPrefix => _t('Error: ', 'Error: ');

  // Lyric Detail Page
  String get noInternetConnection => _t('No internet connection', 'Tidak ada koneksi internet');
  String get songGlossary => _t('Song Glossary', 'Glosarium Lagu');
  String get uniqueWords => _t('unique words', 'kata unik');
  String get words => _t('words', 'kata');
  String get analyzingPhrase => _t('Analyzing Phrase', 'Analisis Frasa');
  String get tapToSaveKeyword => _t(
    'Tap to save keyword you find interesting',
    'Ketuk untuk menyimpan kata yang kamu suka',
  );

  // Vocabulary Page
  String get collection => _t('Collection', 'Koleksi');
  String get savedVocabulary => _t('Saved Vocabulary', 'Kosakata Tersimpan');
  String get noVocabSavedYet => _t('No vocabulary saved yet', 'Belum ada kosakata tersimpan');
  String get saveWordsFromLyrics =>
      _t('Save words from lyrics to see them here', 'Simpan kata dari lirik untuk melihatnya di sini');

  // Vocabulary Detail Page
  String get collectionLabel => _t('COLLECTION', 'KOLEKSI');
  String get yourPersonalCollection => _t(
    'Your personal collection of new words discovered and saved for later mastery.',
    'Koleksi kata-kata baru yang kamu temukan dan simpan untuk dipelajari nanti.',
  );
  String get searchYourVocabulary => _t('Search your vocabulary', 'Cari kosakata kamu');
  String get savedWords => _t('Saved Words', 'Kata Tersimpan');
  String showingTerms(int count) => _t('Showing $count terms', '$count kata ditampilkan');
  String get sortLatest => _t('Latest', 'Terbaru');
  String get sortOldest => _t('Oldest', 'Terlama');
  String get sortAscending => _t('Ascending (A → Z)', 'A ke Z');
  String get sortDescending => _t('Descending (Z → A)', 'Z ke A');
}
