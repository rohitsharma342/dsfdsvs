import 'package:flutter/material.dart';
import '../models/comic.dart';
import '../data/static_data.dart';

class ComicProvider extends ChangeNotifier {
  List<Comic> _comics = [];
  List<Comic> _filteredComics = [];
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _isLoading = false;

  List<Comic> get comics => _filteredComics;
  List<Comic> get allComics => _comics;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  List<Comic> get trendingComics =>
      _comics.where((c) => c.isTrending).toList();

  ComicProvider() {
    loadComics();
  }

  Future<void> loadComics() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _comics = StaticData.comics;
    _filteredComics = _comics;
    _isLoading = false;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredComics = _comics.where((comic) {
      bool matchesCategory =
          _selectedCategory == 'All' || comic.category == _selectedCategory;
      bool matchesSearch = _searchQuery.isEmpty ||
          comic.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          comic.author.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
    notifyListeners();
  }

  Comic? getComicById(String id) {
    try {
      return _comics.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Comic> getSavedComics(List<String> savedIds) {
    return _comics.where((c) => savedIds.contains(c.id)).toList();
  }

  List<Comic> getComicsByCategory(String category) {
    if (category == 'All') return _comics;
    return _comics.where((c) => c.category == category).toList();
  }
}
