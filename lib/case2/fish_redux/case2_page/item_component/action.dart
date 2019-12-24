import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemAction { startStopPanelAction }

class ItemActionCreator {
  static Action startStopPanelAction(date) {
    return Action(ItemAction.startStopPanelAction);
  }
}
