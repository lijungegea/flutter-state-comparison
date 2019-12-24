import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
      ItemAction.addStatusAction: _addStatusAction,
      ItemAction.startOrStopAction: _startOrStopAction
    },
  );
}

ItemState _startOrStopAction(ItemState state, Action action) {
  final int index = action.payload['index'];
  if (state.index == index) {
    return state.clone()..isTimerOn = action.payload['isStart'];
  }
  return state;
}

ItemState _addStatusAction(ItemState state, Action action) {
  final ItemState newState = state.clone();
  final int index = action.payload['index'];
  const int _kMaxSamples = 15;

  if (state.index == index) {
    void addStats(double value) {
      newState.stats.add(value);

      int length = newState.stats.length;
      int toSkip = (length - _kMaxSamples).clamp(0, length);

      newState.stats = newState.stats.skip(toSkip).take(_kMaxSamples).toList();
    }

    addStats(action.payload['value']);
    return newState;
  }
  return state;
}
