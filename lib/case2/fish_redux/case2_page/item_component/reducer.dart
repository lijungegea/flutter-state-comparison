import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
      ItemAction.startStopPanelAction: _startStopPanelAction,
    },
  );
}

ItemState _startStopPanelAction(ItemState state, Action action) {
  final ItemState newState = state.clone();
  return newState;
}
