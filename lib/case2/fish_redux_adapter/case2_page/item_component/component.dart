import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ItemComponent extends Component<ItemState> {
  ItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            shouldUpdate: (ItemState old, ItemState now) {
              return old != now;
            },
            filter: (ItemState state, action) {
              return true;
            },
            wrapper: (Widget w) {
              return Container(
                // margin: EdgeInsets.only(top: 20),
                child: w,
                // color: Colors.red,
              );
            });
}
