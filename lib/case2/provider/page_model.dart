import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/provider/provider_model.dart';

class Case2PageModel with ChangeNotifier {
  List<StatsProvider> widgets = <StatsProvider>[];

  addWidget() {
    widgets.add(StatsProvider());
    notifyListeners();
  }
}
