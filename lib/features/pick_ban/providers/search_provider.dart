import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void updateSearch(String query) {
    state = query;
  }

  void clearSearch() {
    state = '';
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, String>(
  (ref) => SearchNotifier(),
); 