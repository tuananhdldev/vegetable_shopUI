import 'package:flutter/material.dart';
import 'package:vegetable_shop/components/fav_button.dart';
import 'package:vegetable_shop/components/price.dart';
import 'package:vegetable_shop/constants.dart';
import 'package:vegetable_shop/controllers/home_controller.dart';
import 'package:vegetable_shop/models/product.dart';
import 'package:vegetable_shop/screens/details/detail_screen.dart';
import 'package:vegetable_shop/screens/product_card.dart';

import 'cart_detail_view.dart';
import 'cart_short_view.dart';
import 'home_header.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Container(
            color: Color(0xffeaeaea),
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      return Stack(children: [
                        //header
                        AnimatedPositioned(
                            top: controller.homeState == HomeState.normal?0: -headerHeight,
                            right: 0,
                            left: 0,
                            child: HomeHeader()  ,
                            duration: panelTransition),
                        //end header

                        //gridview
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? headerHeight
                              : -(constraints.maxHeight -
                                  cartBarHeight * 2 -
                                  headerHeight),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight -
                              headerHeight -
                              cartBarHeight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(defaultPadding * 1.5),
                                  bottomRight:
                                      Radius.circular(defaultPadding * 1.5),
                                )),
                            child: GridView.builder(
                                itemCount: demo_products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.75,
                                        mainAxisSpacing: defaultPadding,
                                        crossAxisSpacing: defaultPadding),
                                itemBuilder: (context, index) => ProductCard(
                                    product: demo_products[index],
                                    press: () {
                                      Navigator.push(context,
                                      PageRouteBuilder(
                                        transitionDuration: const Duration(milliseconds: 500),
                                        reverseTransitionDuration: const Duration(milliseconds: 500),
                                        pageBuilder: (context, animation, secondaryAnimanion)=>
                                            FadeTransition(opacity: animation,
                                            child: DetailScreen(
                                              product: demo_products[index],
                                              onProductAdd: (){
                                                controller.addProductToCart(demo_products[index]);
                                              },
                                            ),)
                                      )
                                      );
                                    })),
                          ),
                        ),
                        //end gridview
                        //bottom card
                        AnimatedPositioned(duration: panelTransition,
                        bottom: 0,
                            left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal?cartBarHeight:
                          (constraints.maxHeight - cartBarHeight),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              color: Color(0xffeaeaea),
                              alignment: Alignment.topLeft,
                              child: AnimatedSwitcher(
                                duration: panelTransition,
                                child: controller.homeState == HomeState.normal?
                                CardShortView(controller: controller):
                                CardDetailView(controller: controller),
                              ),
                            ),
                          ),
                        )
                      ]);
                    },
                  );
                }),
          ),
        )
    );
  }
}
