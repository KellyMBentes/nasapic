import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const MobileAppBar({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        );
      },
    );
  }
}
