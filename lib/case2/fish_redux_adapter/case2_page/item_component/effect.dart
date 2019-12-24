import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';
import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ItemAction.startStopPanelAction: _startStopPanelAction
  });
}

Timer _timer;
void _startStopPanelAction(Action action, Context<ItemState> ctx) {
  if (action.type == ItemAction.startStopPanelAction) {
    void _startTimer() {
      _timer = Timer(Duration(seconds: 1), () async {
        double newValue = await AsyncDataFetcher.getValue();
        ctx.dispatch(ItemActionCreator.addStatsAction(
            {'value': newValue, 'index': action.payload['index']}));
        if (action.payload['isStart']) {
          _startTimer();
        } else {
          _timer.cancel();
        }
      });
    }

    if (action.payload['isStart']) {
      _startTimer();
    } else {
      _timer.cancel();
    }
  }
  ctx.dispatch(ItemActionCreator.startOrStopAction(action.payload));
}
