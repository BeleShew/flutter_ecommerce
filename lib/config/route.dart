import 'package:flutter/material.dart';

import '../pages/mainPage.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const MainPage(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
