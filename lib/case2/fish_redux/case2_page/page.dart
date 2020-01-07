import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';

import 'action.dart';
import 'effect.dart';
import 'item_component/component.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class Case2Page extends Page<Case2State, Map<String, dynamic>> {
  Case2Page()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<Case2State>(
              adapter: null,
              slots: <String, Dependent<Case2State>>{
                'item': ItemConnector() + ItemComponent()
              }),
          middleware: <Middleware<Case2State>>[statusMiddleware<Case2State>()],
        );
}

Middleware<T> statusMiddleware<T>({
  String tag = 'redux',
  String Function(T) monitor,
}) {
  return ({Dispatch dispatch, Get<T> getState}) {
    return (Dispatch next) {
      return (action) {
        Case2State _state = getState() as Case2State;
        if (action.type == Case2Action.startStopPanelAction) {
          void _startTimer() {
            Timer(Duration(seconds: 1), () async {
              double newValue = await AsyncDataFetcher.getValue();
              dispatch(Case2ActionCreator.addStatsAction({
                'index': action.payload['index'],
                'value': newValue,
              }));
              if (_state.widgets[action.payload['index']].isTimerOn) {
                _startTimer();
              }
            });
          }

          if (action.payload['isStart']) {
            _startTimer();
          }
        }
        next(action);
      };
    };
  };
}
