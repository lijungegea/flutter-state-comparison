import 'package:fish_redux/fish_redux.dart';
import 'package:redux_scopedmodel_bloc/case2/fish_redux_adapter/case2_page/action.dart';
import 'state.dart';

Effect<Case2State> buildEffect() {
  return combineEffects(<Object, Effect<Case2State>>{
    Lifecycle.disappear: (Action action, Context<Case2State> ctx) {
      print('1111111111');
    }
  });
}

// void _addStatusAction(Action action, Context<Case2State> ctx) {
//   ctx.dispatch(Case2ActionCreator.startStopPanelAction(action.payload));
// }
