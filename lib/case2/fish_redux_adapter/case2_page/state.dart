import 'package:fish_redux/fish_redux.dart';

import 'item_component/state.dart';

class Case2State extends MutableSource implements Cloneable<Case2State> {
  List<ItemState> widgets;

  @override
  Case2State clone() {
    return Case2State()..widgets = widgets;
  }

  @override
  Object getItemData(int index) => widgets[index];

  @override
  String getItemType(int index) => 'item';

  @override
  int get itemCount => widgets?.length ?? 0;

  @override
  void setItemData(int index, Object data) => widgets[index] = data;
}

Case2State initState(Map<String, dynamic> args) {
  return Case2State()..widgets = [];
}
