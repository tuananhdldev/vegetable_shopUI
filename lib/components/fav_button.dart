import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vegetable_shop/constants.dart';

class FavBtn extends StatelessWidget {

  final double radius;
  const FavBtn({Key? key, this.radius = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xFF7AC17D),
      child: SvgPicture.asset("assets/icons/heart.svg"),
    );
  }
}
