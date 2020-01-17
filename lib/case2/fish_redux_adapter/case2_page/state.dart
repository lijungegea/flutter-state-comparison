import 'package:fish_redux/fish_redux.dart';
import 'package:redux_scopedmodel_bloc/case2/fish_redux_adapter/case2_page/bigCell_component/state.dart';

import 'item_component/state.dart';

class Case2State extends MutableSource implements Cloneable<Case2State> {
  List<ItemState> widgets;
  ItemState cell;
  @override
  Case2State clone() {
    return Case2State()..widgets = widgets;
  }

  @override
  Object getItemData(int index) => index == 0 ? cell : widgets[index - 1];

  @override
  String getItemType(int index) => index == 0 ? 'cell' : 'item';

  @override
  int get itemCount => widgets?.length + 1 ?? 0;

  // 从维护一个List<Widget> 转换为 List<data>
  @override
  void setItemData(int index, Object data) =>
      index == 0 ? cell = data : widgets[index - 1] = data;
}

Case2State initState(Map<String, dynamic> args) {
  return Case2State()..widgets = [];
}

class BigCellConnector extends ConnOp<Case2State, BigCellState>
    with ReselectMixin<Case2State, BigCellState> {
  @override
  BigCellState computed(Case2State state) {
    return BigCellState();
  }

  @override
  List<dynamic> factors(Case2State state) {
    return <int>[];
  }

  @override
  void set(Case2State state, BigCellState subState) {
    throw Exception('Unexcepted to set Case2State from BigCellState');
  }
}
