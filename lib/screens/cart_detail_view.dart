import 'package:flutter/material.dart';
import 'package:vegetable_shop/components/price.dart';
import 'package:vegetable_shop/constants.dart';
import 'package:vegetable_shop/controllers/home_controller.dart';
import 'package:vegetable_shop/models/product_item.dart';

class CardDetailView extends StatelessWidget {
  final HomeController controller;
  const CardDetailView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.headline6,),
          ...List.generate(controller.cart.length, (index) => CardDetailViewCard(productItem: controller.cart[index])),
        SizedBox(height: defaultPadding,),
         SizedBox(
           width: double.infinity,
           child: ElevatedButton(
             onPressed: (){},
             child: Text('Next- \$30'),
           ),
         )
        ],

      ),
    );
  }
}
class CardDetailViewCard extends StatelessWidget {
  final ProductItem productItem;
  const CardDetailViewCard({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical:  defaultPadding/2),
      leading: CircleAvatar(
        radius: 25,
        foregroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product!.image!),
      ),
      title: Text(
        productItem.product!.title!,
        style:  Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing:  FittedBox(
        child: Row(
          children: [Price(amount: "20"),
          Text(" x ${productItem.quantity} ", style: Theme.of(context).textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}

