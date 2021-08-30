import 'package:flutter/material.dart';
import 'package:vegetable_shop/components/fav_button.dart';
import 'package:vegetable_shop/components/price.dart';
import 'package:vegetable_shop/constants.dart';
import 'package:vegetable_shop/models/product.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final VoidCallback press;

  const ProductCard({Key? key, required this.product, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            color: Color(0xfff7f7f7),
            borderRadius: const BorderRadius.all(Radius.circular(defaultPadding*1.25)
        )
          ),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Hero(tag: product.title!, child: Image.asset(product.image!)),
          Text(product.title!,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),

          ),
          Text("Fruits", style: Theme.of(context).textTheme.caption,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Price(amount: "20.0"),
              FavBtn()
            ],
          )


        ],

      ),
        )
    );
  }
}
