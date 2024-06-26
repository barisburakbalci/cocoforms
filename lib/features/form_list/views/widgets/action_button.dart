import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20.0,
      visualDensity: VisualDensity.compact,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
