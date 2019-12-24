import 'package:fish_redux/fish_redux.dart';

import '../panel_state.dart';
import 'item_component/state.dart';

class Case2State implements Cloneable<Case2State> {
  List<PanelState> widgets;

  @override
  Case2State clone() {
    return Case2State()..widgets = widgets;
  }
}

Case2State initState(Map<String, dynamic> args) {
  return Case2State()..widgets = [];
}

class ItemConnector extends ConnOp<Case2State, ItemState>
    with ReselectMixin<Case2State, ItemState> {
  @override
  ItemState computed(Case2State state) {
    return ItemState()
      ..data = [1.0]
      ..isActive = false
      ..panelIndex = state.widgets.length - 1;
  }

  @override
  List<dynamic> factors(Case2State state) {
    return [state.widgets.length - 1];
  }

  @override
  void set(Case2State state, ItemState subState) {
    throw Exception('Unexcepted to set Case2State from ItemState');
  }
}
