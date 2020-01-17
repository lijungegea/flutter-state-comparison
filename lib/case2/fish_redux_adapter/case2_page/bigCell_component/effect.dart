import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

Effect<BigCellState> buildEffect() {
  return combineEffects(<Object, Effect<BigCellState>>{
    Lifecycle.deactivate: (Action action, Context<BigCellState> ctx) {
      print('big cell dispose!');
    }
  });
}

// void _addStatusAction(Action action, Context<Case2State> ctx) {
//   ctx.dispatch(Case2ActionCreator.startStopPanelAction(action.payload));
// }
