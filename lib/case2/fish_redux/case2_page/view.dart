import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'item_component/view.dart';
import 'state.dart';

Widget buildView(Case2State state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('REDUX list'),
      actions: <Widget>[
        RaisedButton(
          child: Text('Add...'),
          onPressed: () {
            dispatch(Case2ActionCreator.addItemAction());
          },
        )
      ],
    ),
    body: Container(
      child: GridView.builder(
        itemCount: state.widgets.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return ItemFul(
              state: state,
              dispatch: dispatch,
              viewService: viewService,
              index: index);
        },
      ),
    ),
  );
  ;
}
