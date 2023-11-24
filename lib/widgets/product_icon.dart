import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/extentions.dart';
import 'package:flutter_ecommerce/widgets/title_text.dart';

import '../model/category.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductIcon({Key? key, required this.model, required this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                color: model.isSelected??false
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected??false ? LightColor.orange : LightColor.grey,
                  width: model.isSelected??false ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected??false ? const Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(model.image??""),
                  SizedBox(
                          child: TitleText(
                            text: model.name??"",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
