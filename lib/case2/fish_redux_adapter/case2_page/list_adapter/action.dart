import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ListAction { addItemAction }

class ListActionCreator {
  static Action addItemAction(int index) {
    return Action(ListAction.addItemAction, payload: index);
  }
}
