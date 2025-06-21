import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/services/local_storage_service.dart';

class FoodTag {
  final String name;
  final int quantity;

  FoodTag({required this.name, required this.quantity});
}

class MenuViewModel extends BaseViewModel {
  final localStorageService = locator<LocalStorageService>();

  String selectedCategory = 'Meal';

  List<Map<String, dynamic>> selectedMenuTags = [
    {"name": "Rice", "quantity": 1},
    {"name": "Soup", "quantity": 2},
    {"name": "Protein", "quantity": 1},
    {"name": "Swallow", "quantity": 1},
  ];
  void addOrUpdateItem(String name) {
    final index = selectedMenuTags.indexWhere((item) => item['name'] == name);
    if (index != -1) {
      // Item exists, increase quantity
      selectedMenuTags[index]['quantity'] += 1;
    } else {
      // New item
      selectedMenuTags.add({'name': name, 'quantity': 1});
    }
    notifyListeners();
  }

  void removeItem(String name) {
    selectedMenuTags.removeWhere((item) => item['name'] == name);
    notifyListeners();
  }

  final List<Map<String, dynamic>> menuItems = [
    {
      "name": "Rice",
      "image": "assets/images/rice.jpg",
      "price": 424,
      "originalPrice": 526,
    },
    {
      "name": "Soup",
      "image": "assets/images/soup.jpg",
      "price": 198,
      "originalPrice": 234,
    },
    {
      "name": "Protein",
      "image": "assets/images/protein.jpg",
      "price": 304,
      "originalPrice": 423,
    },
    {
      "name": "Soup",
      "image": "assets/images/soup2.jpg",
      "price": 224,
      "originalPrice": 284,
    },
    {
      "name": "Breakfast",
      "image": "assets/images/breakfast.jpg",
      "price": 424,
      "originalPrice": 526,
    },
    {
      "name": "Swallow",
      "image": "assets/images/swallow.jpg",
      "price": 424,
      "originalPrice": 526,
    },
  ];

  final List<String> categories = ['Meal', 'Drinks', 'Others'];
}
