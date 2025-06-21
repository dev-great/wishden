import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/models/app_model/amenities.dart';
import 'package:wishden/services/local_storage_service.dart';

class HomeDetailedViewModel extends BaseViewModel {
  final localStorageService = locator<LocalStorageService>();

  final List<AmenityItem> amenities = [
    AmenityItem(icon: Icons.bed, label: 'King Bed'),
    AmenityItem(icon: Icons.wifi, label: 'Free Wi-Fi'),
    AmenityItem(icon: Icons.ac_unit, label: 'Air Conditioner'),
    AmenityItem(icon: Icons.tv, label: 'Smart TV'),
    AmenityItem(icon: Icons.pool, label: 'Swimming Pool'),
    AmenityItem(icon: Icons.restaurant, label: 'Restaurant'),
    AmenityItem(icon: Icons.local_parking, label: 'Free Parking'),
    AmenityItem(icon: Icons.fitness_center, label: 'Gym Access'),
  ];
}
