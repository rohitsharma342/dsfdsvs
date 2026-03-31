import 'chapter.dart';

class Comic {
  final String id;
  final String title;
  final String author;
  final String description;
  final String coverImage;
  final String category;
  final double rating;
  final int views;
  final List<Chapter> chapters;
  final bool isTrending;
  final DateTime publishedDate;

  Comic({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.coverImage,
    required this.category,
    required this.rating,
    required this.views,
    required this.chapters,
    this.isTrending = false,
    required this.publishedDate,
  });

  Comic copyWith({
    String? id,
    String? title,
    String? author,
    String? description,
    String? coverImage,
    String? category,
    double? rating,
    int? views,
    List<Chapter>? chapters,
    bool? isTrending,
    DateTime? publishedDate,
  }) {
    return Comic(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      coverImage: coverImage ?? this.coverImage,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      views: views ?? this.views,
      chapters: chapters ?? this.chapters,
      isTrending: isTrending ?? this.isTrending,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }
}
