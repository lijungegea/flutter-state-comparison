import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  bool isActive;
  List<double> stats = <double>[];
  bool isTimerOn = false;
  int index;

  @override
  ItemState clone() {
    return ItemState()
      ..isActive = isActive
      ..isTimerOn = isTimerOn
      ..index = index
      ..stats = stats;
  }
}
