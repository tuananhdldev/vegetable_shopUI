import 'package:flutter/material.dart';
import 'package:vegetable_shop/constants.dart';
import 'package:vegetable_shop/controllers/home_controller.dart';

class CardShortView extends StatelessWidget {
  final HomeController controller;
  const CardShortView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Cart', style: Theme.of(context).textTheme.headline6,),
        const SizedBox(width: defaultPadding,),
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.cart.length, (index) => Padding(padding: const EdgeInsets.only(right: defaultPadding/2),
            child: Hero(
              tag: controller.cart[index].product!.title! + "_cartTag",
              child: CircleAvatar(backgroundColor: Colors.white,
              backgroundImage: AssetImage(controller.cart[index].product!.image!),
              ),
            ),
            )),
          ),
        )
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            controller.totalCartItems().toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        )
      ],
    );
  }
}
