import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/mainPage.dart';
import 'package:flutter_ecommerce/pages/product_detail.dart';
import 'package:flutter_ecommerce/themes/theme.dart';
import 'package:flutter_ecommerce/widgets/customRoute.dart';

import 'config/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme:TextTheme(

        )
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name?.contains('detail')??false) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const ProductDetailPage());
        }
        else {
          return CustomRoute<bool>(builder: (BuildContext context) => const MainPage());
        }
      },
      initialRoute: "MainPage",
    );
  }
}