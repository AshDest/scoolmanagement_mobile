import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: isOutlined
          ? OutlinedButton.icon(
              onPressed: isLoading ? null : onPressed,
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : icon != null
                      ? Icon(icon, color: textColor ?? Theme.of(context).primaryColor)
                      : const SizedBox.shrink(),
              label: Text(text),
              style: OutlinedButton.styleFrom(
                foregroundColor: textColor ?? Theme.of(context).primaryColor,
                side: BorderSide(
                  color: textColor ?? Theme.of(context).primaryColor,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          : ElevatedButton.icon(
              onPressed: isLoading ? null : onPressed,
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : icon != null
                      ? Icon(icon, color: textColor ?? Colors.white)
                      : const SizedBox.shrink(),
              label: Text(text),
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
                foregroundColor: textColor ?? Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
    );
  }
}

