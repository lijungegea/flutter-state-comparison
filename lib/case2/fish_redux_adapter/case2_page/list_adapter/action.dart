import 'package:fish_redux/fish_redux.dart';

enum ListAction { addItemAction }

class ListActionCreator {
  static Action addItemAction(int index) {
    return Action(ListAction.addItemAction, payload: index);
  }
}
