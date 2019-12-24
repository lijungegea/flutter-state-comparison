import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/bloc/bloc_application.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/redux_application.dart';
import 'package:redux_scopedmodel_bloc/case2/scoped_model/scoped_model_application.dart';

import 'case2/fish_redux/fish_app.dart';
import 'case2/fish_redux_adapter/fish_app.dart';
import 'case2/provider/Provider_app.dart';

void main() {
  mainCase2Bloc();
  //  mainCase2ScopedModel();
  // mainCase2Redux();
  // mainCase2FishRedux();
  // mainCase2FishAdaptorRedux();
  // mainCase2Provider();
}

void mainCase2Bloc() {
  runApp(Case2BlocApplication());
}

void mainCase2ScopedModel() {
  runApp(Case2ScopedModelApplication());
}

void mainCase2Redux() {
  runApp(Case2ReduxApplication());
}

void mainCase2FishRedux() {
  runApp(case2FishRuduxApp());
}

void mainCase2FishAdaptorRedux() {
  runApp(case2FishRuduxAdaptorApp());
}

void mainCase2Provider() {
  runApp(Case2ProviderApp());
}
