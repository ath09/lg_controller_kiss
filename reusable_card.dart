import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild, required this.onPress});
  final Color colour;
  final Widget? cardChild;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(20),
            //border: Border.all(width: 2,color: Colors.black),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.grey,
                spreadRadius: 6,
                offset: Offset(4.0, 4.0)
              ),
              BoxShadow(
blurRadius: 15,
                color: Colors.white,
                spreadRadius: 6,
                offset: Offset(-4.0, -4.0)
              
              )
            ]),
        child: cardChild,
      ),
    );
  }
}
