class AppConstants {
  static const String appName = 'dsfdsvs';
  static const String appTagline = 'Your Comic Universe';
  
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration carouselAutoPlayDuration = Duration(seconds: 5);
  
  static const int maxSearchResults = 20;
  static const int comicsPerPage = 10;
  
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 16.0;
  static const double buttonBorderRadius = 12.0;
  
  static const String placeholderImageUrl = 
      'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?w=400';
}

class StorageKeys {
  static const String isFirstLaunch = 'is_first_launch';
  static const String authToken = 'auth_token';
  static const String userId = 'user_id';
  static const String themeMode = 'theme_mode';
  static const String language = 'language';
  static const String readingProgress = 'reading_progress';
  static const String bookmarks = 'bookmarks';
  static const String savedComics = 'saved_comics';
}
