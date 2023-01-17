import 'package:persuasion_app/message/message.dart';
import 'package:persuasion_app/model/message_model.dart';

class MainLogic {}

class PageLogic {
  final List<MessageModel> _items = Message().messageList;

  get items => _items;
  get itemCount => _items.length;
}
