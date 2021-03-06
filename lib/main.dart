import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/bloc_add_one/app.dart';
import 'package:redux_scopedmodel_bloc/case2/flutter_redux/redux_application.dart';
import 'package:redux_scopedmodel_bloc/case2/rx_bloc/bloc_application.dart';
import 'package:redux_scopedmodel_bloc/case2/scoped_model/scoped_model_application.dart';
import 'package:redux_scopedmodel_bloc/my_animation_builder_provider/app.dart';
import 'package:redux_scopedmodel_bloc/my_stateful_provider/app.dart';

import 'case2/fish_redux/fish_app.dart';
import 'case2/fish_redux_adapter/fish_app.dart';
import 'case2/flutter_hook/hook_app.dart';
import 'case2/provider/Provider_app.dart';

void main() {
  // mainCase2RxBloc();
  // mainCase2ScopedModel();
  // mainCase2Redux();
  // mainCase2FishRedux();
  mainCase2FishAdaptorRedux();
  // mainCase2Provider();
  // mainCase2Hook();
  // mainBlocAddOne();
  // mainMyStateFulProvider();
  // mainMyAnimationProvider();
}

void mainCase2RxBloc() {
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

void mainCase2FishAdaptorRedux() async {
  runApp(case2FishRuduxAdaptorApp());
}

void mainCase2Provider() {
  runApp(Case2ProviderApp());
}

void mainCase2Hook() {
  runApp(Case2HookApp());
}

void mainBlocAddOne() {
  runApp(BlocAddOneApplication());
}

void mainMyStateFulProvider() {
  runApp(MyProviderChartApp());
}

void mainMyAnimationProvider() {
  runApp(MyAnimationProviderChartApp());
}
