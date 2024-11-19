import 'package:flutter/cupertino.dart';

class CustomCupertinoButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const CustomCupertinoButton({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      // pressedOpacity: 0,
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: onTap,
      child: child,
    );
  }
}
