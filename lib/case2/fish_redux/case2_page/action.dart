import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum Case2Action { addItemAction, addStatusAction, startStopPanelAction }

class Case2ActionCreator {
  static Action addItemAction() {
    return Action(Case2Action.addItemAction);
  }

  static Action addStatsAction(dynamic data) {
    return Action(Case2Action.addStatusAction, payload: data);
  }

  static Action startStopPanelAction(dynamic data) {
    return Action(Case2Action.startStopPanelAction, payload: data);
  }
}
