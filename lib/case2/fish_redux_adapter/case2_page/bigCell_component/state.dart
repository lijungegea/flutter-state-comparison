import 'package:fish_redux/fish_redux.dart';

class BigCellState implements Cloneable<BigCellState> {

  @override
  BigCellState clone() {
    return BigCellState();
  }
}

BigCellState initState(Map<String, dynamic> args) {
  return BigCellState();
}
