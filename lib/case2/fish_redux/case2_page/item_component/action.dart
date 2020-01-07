import 'package:fish_redux/fish_redux.dart';

enum ItemAction { startStopPanelAction }

class ItemActionCreator {
  static Action startStopPanelAction(date) {
    return Action(ItemAction.startStopPanelAction);
  }
}
