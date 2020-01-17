import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/rx_bloc/bloc_widget.dart';

import 'state.dart';

Widget buildView(
    BigCellState state, Dispatch dispatch, ViewService viewService) {
  print('------------------------>big cell build');
  return Container(
    height: 300,
    color: Colors.red,
    child: Center(
      child: BlocWidget(),
    ),
  );
}
