import 'package:flutter/material.dart';
import '../models/user.dart';
import '../data/static_data.dart';

enum AuthState { initial, loading, authenticated, unauthenticated, error }

class AuthProvider extends ChangeNotifier {
  AuthState _state = AuthState.initial;
  User? _user;
  String? _errorMessage;

  AuthState get state => _state;
  User? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _state == AuthState.authenticated;

  Future<void> checkAuthState() async {
    _state = AuthState.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    _state = AuthState.unauthenticated;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _state = AuthState.loading;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@test.com' && password == 'password') {
      _user = StaticData.mockUser.copyWith(email: email);
      _state = AuthState.authenticated;
      notifyListeners();
      return true;
    } else if (email.isNotEmpty && password.length >= 6) {
      _user = StaticData.mockUser.copyWith(email: email);
      _state = AuthState.authenticated;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Invalid email or password';
      _state = AuthState.error;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    _state = AuthState.loading;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _user = User(
      id: 'new_user_${DateTime.now().millisecondsSinceEpoch}',
      username: username,
      email: email,
    );
    _state = AuthState.authenticated;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _state = AuthState.loading;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _user = null;
    _state = AuthState.unauthenticated;
    notifyListeners();
  }

  Future<bool> updateProfile({
    String? username,
    String? email,
    bool? notificationsEnabled,
    bool? emailNotifications,
  }) async {
    if (_user == null) return false;

    await Future.delayed(const Duration(milliseconds: 500));

    _user = _user!.copyWith(
      username: username ?? _user!.username,
      email: email ?? _user!.email,
      notificationsEnabled: notificationsEnabled ?? _user!.notificationsEnabled,
      emailNotifications: emailNotifications ?? _user!.emailNotifications,
    );
    notifyListeners();
    return true;
  }

  void toggleSavedComic(String comicId) {
    if (_user == null) return;

    List<String> savedIds = List.from(_user!.savedComicIds);
    if (savedIds.contains(comicId)) {
      savedIds.remove(comicId);
    } else {
      savedIds.add(comicId);
    }
    _user = _user!.copyWith(savedComicIds: savedIds);
    notifyListeners();
  }

  void updateReadingProgress(String comicId, int page) {
    if (_user == null) return;

    Map<String, int> progress = Map.from(_user!.readingProgress);
    progress[comicId] = page;
    _user = _user!.copyWith(readingProgress: progress);
    notifyListeners();
  }

  void toggleBookmark(String comicId, int page) {
    if (_user == null) return;

    Map<String, List<int>> bookmarks = Map.from(_user!.bookmarks);
    List<int> comicBookmarks = List.from(bookmarks[comicId] ?? []);

    if (comicBookmarks.contains(page)) {
      comicBookmarks.remove(page);
    } else {
      comicBookmarks.add(page);
    }

    bookmarks[comicId] = comicBookmarks;
    _user = _user!.copyWith(bookmarks: bookmarks);
    notifyListeners();
  }

  bool isComicSaved(String comicId) {
    return _user?.savedComicIds.contains(comicId) ?? false;
  }

  bool isPageBookmarked(String comicId, int page) {
    return _user?.bookmarks[comicId]?.contains(page) ?? false;
  }
}
