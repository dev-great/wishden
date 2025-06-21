import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ReservationRoomViewModel extends BaseViewModel {
  final TextEditingController checkInController = TextEditingController();
  final TextEditingController checkOutController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  int guests = 1;

  DateTime? _dateOfDate;
  DateTime? get dateOfDate => _dateOfDate;

  Future<void> selectCheckInDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime initialDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != initialDate) {
      _dateOfDate = selectedDate;
      checkInController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      notifyListeners();
    }
  }

  Future<void> selectCheckOutDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime initialDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != initialDate) {
      _dateOfDate = selectedDate;
      checkOutController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      notifyListeners();
    }
  }

  String? selectedRooms;
  String? selectedAdults;
  String? selectedChildren;

  final List<String> numberOptions = ['1', '2', '3', '4', '5'];
  final List<String> childrenOptions = ['0', '1', '2', '3', '4'];

  void setSelectedRooms(String? value) {
    selectedRooms = value;
    notifyListeners();
  }

  void setSelectedAdults(String? value) {
    selectedAdults = value;
    notifyListeners();
  }

  void setSelectedChildren(String? value) {
    selectedChildren = value;
    notifyListeners();
  }
}
