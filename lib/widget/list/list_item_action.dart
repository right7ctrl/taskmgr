import 'package:flutter/material.dart';

class ListItemAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  /// background color
  final Color bgColor;

  /// foreground/icon color
  final Color fgColor;

  final double marginRight;

  const ListItemAction({Key key, this.icon = Icons.delete, @required this.onTap, this.bgColor = Colors.red, this.fgColor = Colors.white, this.marginRight = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: EdgeInsets.only(right: marginRight),
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        child: Icon(icon, color: fgColor),
      ),
    );
  }
}
