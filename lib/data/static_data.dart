import '../models/comic.dart';
import '../models/chapter.dart';
import '../models/notification.dart';
import '../models/user.dart';

class StaticData {
  static List<String> categories = [
    'All',
    'Action',
    'Romance',
    'Fantasy',
    'Sci-Fi',
    'Horror',
    'Comedy',
    'Drama',
  ];

  static User mockUser = User(
    id: 'user_001',
    username: 'ComicLover',
    email: 'comic.lover@email.com',
    profileImage: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    savedComicIds: ['comic_001', 'comic_003', 'comic_005'],
    readingProgress: {
      'comic_001': 5,
      'comic_003': 12,
    },
    bookmarks: {
      'comic_001': [3, 7, 15],
      'comic_003': [1, 8],
    },
  );

  static List<Comic> comics = [
    Comic(
      id: 'comic_001',
      title: 'Shadow Hunters',
      author: 'Alex Storm',
      description: 'In a world where shadows come alive, a young hunter must protect humanity from the darkness that lurks in every corner. Join Marcus on his epic journey through realms unknown.',
      coverImage: 'https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400',
      category: 'Action',
      rating: 4.8,
      views: 125000,
      isTrending: true,
      publishedDate: DateTime(2024, 1, 15),
      chapters: _generateChapters('comic_001', 25),
    ),
    Comic(
      id: 'comic_002',
      title: 'Love in Pixels',
      author: 'Sarah Chen',
      description: 'A heartwarming story about two game developers who fall in love while creating the world\'s most popular video game. Will their love survive the pressures of success?',
      coverImage: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
      category: 'Romance',
      rating: 4.6,
      views: 98000,
      isTrending: true,
      publishedDate: DateTime(2024, 2, 1),
      chapters: _generateChapters('comic_002', 18),
    ),
    Comic(
      id: 'comic_003',
      title: 'Dragon\'s Legacy',
      author: 'Michael Drake',
      description: 'The last dragon rider awakens after a thousand years to find the world has forgotten magic. Now she must restore balance before ancient evils return.',
      coverImage: 'https://images.unsplash.com/photo-1577493340887-b7bfff550145?w=400',
      category: 'Fantasy',
      rating: 4.9,
      views: 250000,
      isTrending: true,
      publishedDate: DateTime(2023, 11, 20),
      chapters: _generateChapters('comic_003', 45),
    ),
    Comic(
      id: 'comic_004',
      title: 'Neon Streets',
      author: 'Yuki Tanaka',
      description: 'In the cyberpunk city of Neo Tokyo, a hacker uncovers a conspiracy that could change humanity forever. Jack into the matrix and ride the digital wave.',
      coverImage: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400',
      category: 'Sci-Fi',
      rating: 4.7,
      views: 180000,
      isTrending: false,
      publishedDate: DateTime(2024, 1, 5),
      chapters: _generateChapters('comic_004', 30),
    ),
    Comic(
      id: 'comic_005',
      title: 'Midnight Manor',
      author: 'Edgar Blackwood',
      description: 'When five strangers inherit an old mansion, they discover its dark secrets one horrifying night at a time. Not everyone will survive until dawn.',
      coverImage: 'https://images.unsplash.com/photo-1509248961725-aec71c53d26c?w=400',
      category: 'Horror',
      rating: 4.5,
      views: 75000,
      isTrending: false,
      publishedDate: DateTime(2024, 2, 14),
      chapters: _generateChapters('comic_005', 12),
    ),
    Comic(
      id: 'comic_006',
      title: 'Office Chaos',
      author: 'Jenny Park',
      description: 'The daily misadventures of a quirky office team who somehow manage to complete zero work while having maximum fun. Laugh out loud comedy!',
      coverImage: 'https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?w=400',
      category: 'Comedy',
      rating: 4.4,
      views: 120000,
      isTrending: false,
      publishedDate: DateTime(2023, 12, 10),
      chapters: _generateChapters('comic_006', 50),
    ),
    Comic(
      id: 'comic_007',
      title: 'Broken Hearts Club',
      author: 'Maria Santos',
      description: 'Four friends navigate love, loss, and life in the big city. A touching drama about finding yourself and the people who matter most.',
      coverImage: 'https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?w=400',
      category: 'Drama',
      rating: 4.8,
      views: 145000,
      isTrending: true,
      publishedDate: DateTime(2024, 1, 25),
      chapters: _generateChapters('comic_007', 35),
    ),
    Comic(
      id: 'comic_008',
      title: 'Space Pirates',
      author: 'Captain Nova',
      description: 'Join the crew of the Stellar Revenge as they plunder the galaxy, evade the Space Federation, and search for the legendary Cosmic Treasure.',
      coverImage: 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
      category: 'Sci-Fi',
      rating: 4.6,
      views: 95000,
      isTrending: false,
      publishedDate: DateTime(2023, 10, 30),
      chapters: _generateChapters('comic_008', 28),
    ),
  ];

  static List<Chapter> _generateChapters(String comicId, int count) {
    return List.generate(count, (index) {
      return Chapter(
        id: '${comicId}_ch_${index + 1}',
        title: 'Chapter ${index + 1}',
        chapterNumber: index + 1,
        pages: _generatePages(index + 1),
        releaseDate: DateTime.now().subtract(Duration(days: (count - index) * 7)),
      );
    });
  }

  static List<String> _generatePages(int chapterNum) {
    List<String> pageImages = [
      'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?w=600',
      'https://images.unsplash.com/photo-1618336753974-aae8e04506aa?w=600',
      'https://images.unsplash.com/photo-1611457194403-d3f156e14d4c?w=600',
      'https://images.unsplash.com/photo-1608889825103-eb5ed706fc64?w=600',
      'https://images.unsplash.com/photo-1560393464-5c69a73c5770?w=600',
      'https://images.unsplash.com/photo-1534809027769-b00d750a6bac?w=600',
      'https://images.unsplash.com/photo-1611604548018-d56bbd85d681?w=600',
      'https://images.unsplash.com/photo-1609743522653-52354461eb27?w=600',
      'https://images.unsplash.com/photo-1605106702734-205df224ecce?w=600',
      'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=600',
    ];
    int pageCount = 8 + (chapterNum % 5);
    return List.generate(pageCount, (index) => pageImages[index % pageImages.length]);
  }

  static List<AppNotification> notifications = [
    AppNotification(
      id: 'notif_001',
      title: 'New Chapter Available!',
      message: 'Dragon\'s Legacy Chapter 46 is now available to read.',
      type: NotificationType.newChapter,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
      relatedComicId: 'comic_003',
    ),
    AppNotification(
      id: 'notif_002',
      title: 'Recommended for You',
      message: 'Based on your reading history, you might enjoy "Space Pirates".',
      type: NotificationType.recommendation,
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: false,
      relatedComicId: 'comic_008',
    ),
    AppNotification(
      id: 'notif_003',
      title: 'App Update',
      message: 'New features are now available! Check out the improved reader.',
      type: NotificationType.update,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    AppNotification(
      id: 'notif_004',
      title: 'New Chapter Available!',
      message: 'Shadow Hunters Chapter 26 is now available to read.',
      type: NotificationType.newChapter,
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
      relatedComicId: 'comic_001',
    ),
    AppNotification(
      id: 'notif_005',
      title: 'Welcome Bonus',
      message: 'Thanks for joining! Enjoy unlimited reading this week.',
      type: NotificationType.system,
      timestamp: DateTime.now().subtract(const Duration(days: 7)),
      isRead: true,
    ),
  ];
}
