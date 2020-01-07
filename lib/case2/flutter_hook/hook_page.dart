import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hook_widget.dart';

class Case2HookPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List> _widgets = useState([]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hook version'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Add...'),
            onPressed: () {
              _widgets.value.add({});
              List _newList = List();
              _newList.addAll(_widgets.value);
              _widgets.value = _newList;
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _widgets.value.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Case2HookWidget();
        },
      ),
    );
  }
}
