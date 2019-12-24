import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  List<double> data;
  bool isActive;
  int panelIndex;
  @override
  ItemState clone() {
    return ItemState()
      ..data = data
      ..isActive = isActive
      ..panelIndex = panelIndex;
  }
}
