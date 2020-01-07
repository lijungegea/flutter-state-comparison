import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

Effect<Case2State> buildEffect() {
  return combineEffects(<Object, Effect<Case2State>>{
    // Case2Action.startStopPanelAction: _addStatusAction
  });
}

// void _addStatusAction(Action action, Context<Case2State> ctx) {
//   ctx.dispatch(Case2ActionCreator.startStopPanelAction(action.payload));
// }
