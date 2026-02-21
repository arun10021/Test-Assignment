import 'package:flutter/cupertino.dart';

import '../models/destination_model.dart';
import '../utils/dummy_data.dart';

class DestinationProvider extends ChangeNotifier {
  final List<DestinationModel> _allDestinations = List.from(DummyData.popularPlaces);
  final List<TripPackageModel> _packages = List.from(DummyData.popularPackages);
  final List<ScheduleModel> _schedules = List.from(DummyData.mySchedule);
  String _selectedCategory = 'All';
  String _searchQuery = '';
  double _minPrice = 0;
  double _maxPrice = 2000;
  double _minRating = 0;
  DestinationModel? _selectedDestination;

  List<DestinationModel> get allDestinations => _allDestinations;
  List<TripPackageModel> get packages => _packages;
  List<ScheduleModel> get schedules => _schedules;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  double get minRating => _minRating;
  DestinationModel? get selectedDestination => _selectedDestination;

  int _imageIndex = 0;
  int get imageIndex => _imageIndex;
  void setImageIndex(int index) {
    _imageIndex = index;
    notifyListeners();
  }

  List<DestinationModel> get filteredDestinations {
    return _allDestinations.where((dest) {
      final matchesCategory =
          _selectedCategory == 'All' ||
              dest.country.contains(_selectedCategory) ||
              dest.name.toLowerCase().contains(_selectedCategory.toLowerCase());
      final matchesSearch =
          _searchQuery.isEmpty ||
              dest.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              dest.location.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesPrice =
          dest.pricePerPerson >= _minPrice && dest.pricePerPerson <= _maxPrice;
      final matchesRating = dest.rating >= _minRating;
      return matchesCategory && matchesSearch && matchesPrice && matchesRating;
    }).toList();
  }

  List<DestinationModel> get favoriteDestinations =>
      _allDestinations.where((d) => d.isFavorite).toList();

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _allDestinations.indexWhere((d) => d.id == id);
    if (index != -1) {
      _allDestinations[index].isFavorite = !_allDestinations[index].isFavorite;
      notifyListeners();
    }
  }

  void setSelectedDestination(DestinationModel dest) {
    _selectedDestination = dest;
    notifyListeners();
  }

  void applyFilters({
    required double minPrice,
    required double maxPrice,
    required double minRating,
  }) {
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _minRating = minRating;
    notifyListeners();
  }

  void resetFilters() {
    _minPrice = 0;
    _maxPrice = 2000;
    _minRating = 0;
    _selectedCategory = 'All';
    notifyListeners();
  }
}