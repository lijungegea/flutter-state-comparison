import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux_scopedmodel_bloc/case2/provider/page_model.dart';

import 'provider_page.dart';

class Case2ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Case2PageModel>.value(
        value: Case2PageModel(),
        child: Case2ProviderPage(),
      ),
    );
  }
}
