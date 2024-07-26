class GeetaModal {
  late int Chapter;
  late ChapterName chapterName;
  late List<Verse> verses;

  GeetaModal(
      {required this.Chapter, required this.verses, required this.chapterName});

  factory GeetaModal.fromJson(Map m1) {
    return GeetaModal(
      Chapter: m1['Chapter'],
      chapterName: ChapterName.fromJson(m1['ChapterName']),
      verses: (m1['Verses'] as List)
          .map(
            (e) => Verse.fromJson(e),
          )
          .toList(),
    );
  }
}

class ChapterName {
  late String hindi, english, gujarati, sanskrit;

  ChapterName(
      {required this.hindi,
      required this.english,
      required this.gujarati,
      required this.sanskrit});

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
        hindi: m1['Hindi'],
        english: m1['English'],
        gujarati: m1['Gujarati'],
        sanskrit: m1['Sanskrit']);
  }
}

class Verse {
  late int verseNumber;
  late Language language;

  Verse({required this.verseNumber, required this.language});

  factory Verse.fromJson(Map m1) {
    return Verse(
        verseNumber: m1['VerseNumber'],
        language: Language.fromJson(m1['Text']));
  }
}

class Language {
  late String hindi, english, gujarati, sanskrit;

  Language(
      {required this.hindi,
      required this.english,
      required this.gujarati,
      required this.sanskrit});

  factory Language.fromJson(Map m1) {
    return Language(
        hindi: m1['Hindi'],
        english: m1['English'],
        gujarati: m1['Gujarati'],
        sanskrit: m1['Sanskrit']);
  }
}
