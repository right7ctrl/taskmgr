import 'package:flutter/material.dart';

class ListItemAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  /// background color
  final Color bgColor;

  /// foreground/icon color
  final Color fgColor;

  const ListItemAction({Key key, this.icon = Icons.delete, @required this.onTap, this.bgColor = Colors.red, this.fgColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        child: Icon(icon, color: fgColor),
      ),
    );
  }
}
