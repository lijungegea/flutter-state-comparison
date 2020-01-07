import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:redux_scopedmodel_bloc/common/SparkLine.dart';

class Case2HookWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    print('----------------------------> hook widget build!');
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
            color: Colors.black,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Sparkline(
                  pointsMode: PointsMode.all,
                  pointColor: Colors.red,
                  data: [2.0],
                ),
              )),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        child: Text(true ? 'Stop' : 'Start'),
                        onPressed: () {})),
              )
            ],
          ),
        );
      },
    );
  }
}
