import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'view.dart';

class BigCellComponent extends Component<BigCellState> {
  BigCellComponent()
      : super(
          view: buildView,
          // wrapper: (Widget w) {
          //   return Container(
          //     // margin: EdgeInsets.only(top: 20),
          //     child: Column(
          //       children: <Widget>[Text('big cell'), w],
          //     ),
          //     // color: Colors.red,
          //   );
          // }
        );
}
