import 'package:flutter/material.dart';


class DateTimeCustomButton extends StatelessWidget {

  const DateTimeCustomButton({Key? key, required this.currentTimeIcon, required this.currentTimeText, this.onTap}) : super(key: key);
  final IconData currentTimeIcon;
  final String currentTimeText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(currentTimeIcon,color: Colors.purple.shade900,),
          Text(currentTimeText,style: TextStyle(color: Colors.purple.shade900),),
        ],
      ),
    );
  }
}