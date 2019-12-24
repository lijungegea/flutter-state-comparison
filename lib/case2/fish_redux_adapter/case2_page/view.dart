import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'item_component/view.dart';
import 'list_adapter/action.dart';
import 'state.dart';

Widget buildView(Case2State state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text('REDUX list'),
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
      child: GridView.builder(
          itemCount: adapter.itemCount,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: adapter.itemBuilder),
    ),
  );
  ;
}
