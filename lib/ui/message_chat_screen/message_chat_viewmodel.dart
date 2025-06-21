import 'package:stacked/stacked.dart';

class MessageChatScreenViewModel extends BaseViewModel {
  final List<Map<String, dynamic>> messages = [
    {
      'message': 'Hi there!',
      'isSender': true,
      'isReservation': false,
    },
    {
      'message': 'Hoe can I help you',
      'isSender': true,
      'isReservation': false,
    },
    {
      'message': 'Im’m Good I made a reservation',
      'isSender': false,
      'isReservation': false,
    },
    {
      'message': 'On table T4',
      'isSender': false,
      'isReservation': false,
    },
    {
      'message': 'The table is taken',
      'isSender': true,
      'isReservation': false,
    },
    {
      'message': 'Should I Suggest a table for you?',
      'isSender': true,
      'isReservation': false,
    },
    {
      'message': 'Yes please',
      'isSender': false,
      'isReservation': false,
    },
    {
      'message': 'Wishden Suggested a table',
      'isSender': false,
      'isReservation': true,
    },
  ];
}
