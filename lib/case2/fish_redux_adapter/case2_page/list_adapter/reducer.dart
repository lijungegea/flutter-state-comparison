import 'package:fish_redux/fish_redux.dart';
import 'package:redux_scopedmodel_bloc/case2/fish_redux_adapter/case2_page/item_component/state.dart';
import 'package:redux_scopedmodel_bloc/case2/fish_redux_adapter/case2_page/state.dart';

import 'action.dart';

Reducer<Case2State> buildReducer() {
  return asReducer(
    <Object, Reducer<Case2State>>{
      ListAction.addItemAction: _addItemAction,
    },
  );
}

Case2State _addItemAction(Case2State state, Action action) {
  final Case2State newState = state.clone();
  newState.widgets = state.widgets.toList()
    ..add(ItemState().clone()..index = action.payload);
  return newState;
}
