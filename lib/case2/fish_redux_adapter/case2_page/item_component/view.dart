import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  return ItemFul(state: state, dispatch: dispatch, viewService: viewService);
}

class ItemFul extends StatefulWidget {
  final ItemState state;
  final Dispatch dispatch;
  final ViewService viewService;
  ItemFul({Key key, this.state, this.dispatch, this.viewService})
      : super(key: key);
  @override
  _ItemFulState createState() => _ItemFulState();
}

class _ItemFulState extends State<ItemFul> {
  // @override
  // void didUpdateWidget(ItemFul oldWidget) {
  //   print('-------------------------------------> item didUpdateWidget');
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    print(
        '-------------------------------------> item build ${widget.state.index}');
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
                  data: widget.state.stats.length == 0
                      ? [1.0]
                      : widget.state.stats,
                ),
              )),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(widget.state.isTimerOn ? 'Stop' : 'Start'),
                      onPressed: () => widget.dispatch(
                          ItemActionCreator.startStopPanelAction({
                        'isStart': !widget.state.isTimerOn,
                        'index': widget.state.index
                      })),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
