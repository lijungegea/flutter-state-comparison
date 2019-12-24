import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';

import 'action.dart';
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
            wrapper: (Widget w) {
              return w;
            });
}
