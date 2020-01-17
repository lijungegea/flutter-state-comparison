import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'list_adapter/action.dart';
import 'state.dart';

Widget buildView(Case2State state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text('fish-adaptor list'),
      leading: RaisedButton(
        child: Text(state.widgets
            .where((f) => f.isTimerOn == true)
            .toList()
            .length
            .toString()),
        onPressed: () {
          dispatch(ListActionCreator.addItemAction(state.widgets.length));
        },
      ),
      actions: <Widget>[
        RaisedButton(
          child: Text('Add...'),
          onPressed: () {
            dispatch(ListActionCreator.addItemAction(state.widgets.length));
          },
        )
      ],
    ),
    body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          // SliverToBoxAdapter(
          //     child: adapter.itemBuilder(viewService.context, 0)),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: new SliverChildBuilderDelegate(adapter.itemBuilder,
                childCount: adapter.itemCount),
          )
        ],
      ),
    ),
  );
}
// GridView.builder(
//           itemCount: adapter.itemCount,
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           itemBuilder: adapter.itemBuilder)
