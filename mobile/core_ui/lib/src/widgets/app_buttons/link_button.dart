import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? foregroundColor;

  const LinkButton({
    required this.onPressed,
    required this.child,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor ?? AppColors.mediumJungleGreen,
        backgroundColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
