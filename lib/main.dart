import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/mainPage.dart';
import 'package:flutter_ecommerce/pages/product_detail.dart';
import 'package:flutter_ecommerce/themes/light_color.dart';
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
        textTheme:const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: LightColor.black,
          ),
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