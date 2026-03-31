class Chapter {
  final String id;
  final String title;
  final int chapterNumber;
  final List<String> pages;
  final DateTime releaseDate;

  Chapter({
    required this.id,
    required this.title,
    required this.chapterNumber,
    required this.pages,
    required this.releaseDate,
  });
}
