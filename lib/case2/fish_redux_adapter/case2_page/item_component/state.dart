import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  List<double> stats = <double>[];
  bool isTimerOn = false;
  int index;

  @override
  ItemState clone() {
    return ItemState()
      ..isTimerOn = isTimerOn
      ..index = index
      ..stats = stats;
  }
}
