import 'dart:async';

import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';
import 'package:redux_scopedmodel_bloc/common/bloc_provider.dart';
import 'package:rxdart/subjects.dart';

const int _kMaxSamples = 15;

class StatsBloc implements BlocBase {
  Timer _timer;

  // BehaviorSubject<bool> _timerActivityController =
  //     BehaviorSubject<bool>.seeded(false);

  /// dart api
  StreamController<bool> _timerActivityController = StreamController<bool>();

  Stream<bool> get timerActivityOut => _timerActivityController.stream;

  BehaviorSubject<List<double>> _statsController =
      BehaviorSubject<List<double>>.seeded([]);

  /// dart api
  // StreamController<List<double>> _statsController =
  //     StreamController<List<double>>();
  Stream<List<double>> get statsOut => _statsController;

  void start([bool notify = true]) {
    _timer = Timer(Duration(seconds: 1), _onTick);

    if (notify == true) {
      _timerActivityController.sink.add(true);
    }
  }

  /// Stops the timer
  void stop() {
    if (_timer != null) {
      _timerActivityController.sink.add(false);
      _timer?.cancel();
      _timer = null;
    }
  }

  void _onTick() async {
    double newValue = await AsyncDataFetcher.getValue();

    _statsController.sink.add((_statsController.value..add(newValue))
        .reversed
        .take(_kMaxSamples)
        .toList()
        .reversed
        .toList());

    if (_timer != null) {
      start(false);
    }
  }

  @override
  void dispose() {
    stop();
    _timerActivityController?.close();
    _statsController?.close();
  }
}
