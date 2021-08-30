import 'package:flutter/material.dart';
import 'package:vegetable_shop/constants.dart';
class CartCounter extends StatefulWidget {

  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: const BorderRadius.all(Radius.circular(40))
      ),
      child: Row(
        children: [
          RoundIconButton(iconData: Icons.remove, color: Colors.black38, press:(){
            if(count >1) setState(() {
              count--;
            });
          }),
          Padding(padding: const EdgeInsets.symmetric(horizontal: defaultPadding/4),
          child: Text("$count", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),),
           RoundIconButton(iconData: Icons.add, color: Colors.black38, press:(){
             setState(() {
               count++;
             });
           }),
        ],
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final VoidCallback press;

  const RoundIconButton({Key? key, required this.iconData, required this.color, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: press,
    padding: EdgeInsets.zero,
      shape: CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      child: Icon(iconData, color: color,),
    );
  }
}

