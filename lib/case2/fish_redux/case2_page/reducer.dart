import 'package:fish_redux/fish_redux.dart';

import '../panel_state.dart';
import 'action.dart';
import 'state.dart';

Reducer<Case2State> buildReducer() {
  return asReducer(
    <Object, Reducer<Case2State>>{
      Case2Action.addItemAction: _addItemAction,
      Case2Action.startStopPanelAction: _startStopPanelAction,
      Case2Action.addStatusAction: _addStatusAction,
    },
  );
}

Case2State _addItemAction(Case2State state, Action action) {
  final Case2State newState = state.clone();
  newState.widgets.add(PanelState());
  return newState;
}

Case2State _startStopPanelAction(Case2State state, Action action) {
  final Case2State newState = state.clone();
  newState.widgets[action.payload['index']].isTimerOn =
      action.payload['isStart'];
  return newState;
}

Case2State _addStatusAction(Case2State state, Action action) {
  final Case2State newState = state.clone();
  newState.widgets[action.payload['index']].addStats(action.payload['value']);
  return newState;
}
