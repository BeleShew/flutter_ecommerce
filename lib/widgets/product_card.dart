import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/extentions.dart';
import 'package:flutter_ecommerce/widgets/title_text.dart';
import '../model/product.dart';
import '../themes/light_color.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  ProductCard({Key? key, required this.product, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !(product.isSelected??false) ? 20 : 0),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  product.isliked??false ? Icons.favorite : Icons.favorite_border,
                  color:
                      product.isliked??false ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: product.isSelected??false ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: LightColor.orange.withAlpha(40),
                      ),
                      Image.asset(product.image??"")
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: product.name??"",
                  fontSize: product.isSelected??false ? 16 : 14,
                ),
                TitleText(
                  text: product.category??"",
                  fontSize: product.isSelected??false ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: product.price.toString(),
                  fontSize: product.isSelected??false ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(product);
      }, borderRadius:const BorderRadius.all(Radius.circular(20))),
    );
  }
}
