class User {
  final String id;
  final String username;
  final String email;
  final String profileImage;
  final List<String> savedComicIds;
  final Map<String, int> readingProgress;
  final Map<String, List<int>> bookmarks;
  final bool notificationsEnabled;
  final bool emailNotifications;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.profileImage = '',
    this.savedComicIds = const [],
    this.readingProgress = const {},
    this.bookmarks = const {},
    this.notificationsEnabled = true,
    this.emailNotifications = true,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? profileImage,
    List<String>? savedComicIds,
    Map<String, int>? readingProgress,
    Map<String, List<int>>? bookmarks,
    bool? notificationsEnabled,
    bool? emailNotifications,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      savedComicIds: savedComicIds ?? this.savedComicIds,
      readingProgress: readingProgress ?? this.readingProgress,
      bookmarks: bookmarks ?? this.bookmarks,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }
}
