import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemAction { startStopPanelAction, addStatusAction, startOrStopAction }

class ItemActionCreator {
  static Action addStatsAction(dynamic data) {
    return Action(ItemAction.addStatusAction, payload: data);
  }

  static Action startStopPanelAction(dynamic data) {
    return Action(ItemAction.startStopPanelAction, payload: data);
  }

  static Action startOrStopAction(dynamic data) {
    return Action(ItemAction.startOrStopAction, payload: data);
  }
}
