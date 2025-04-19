import 'package:flutter/material.dart';
import 'package:kawser/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool fullWidth;
  
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppTheme.primaryButtonStyle,
        child: Text(text),
      ),
    );
  }
}