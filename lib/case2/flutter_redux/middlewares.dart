import 'dart:async';

import 'package:redux/redux.dart';
import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';
import 'package:redux_scopedmodel_bloc/case2/flutter_redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case2/flutter_redux/application_state.dart';

void tickerMiddleware(
    Store<ApplicationState> store, dynamic action, NextDispatcher next) {
  void _startTimer() {
    Timer(Duration(seconds: 1), () async {
      double newValue = await AsyncDataFetcher.getValue();

      store.dispatch(AddStatsAction(
        panelIndex: action.panelIndex,
        value: newValue,
      ));

      if (store.state.panelsList[action.panelIndex].isTimerOn) {
        _startTimer();
      }
    });
  }

  if (action is StartStopPanelAction) {
    if (action.isStart) {
      _startTimer();
    }
  }

  //
  // 必须调用
  //
  next(action);
}

void loggerMiddleware(
    Store<ApplicationState> store, dynamic action, NextDispatcher next) {
  next(action);
}
