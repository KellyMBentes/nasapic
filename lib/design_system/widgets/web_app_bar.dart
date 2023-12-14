import 'package:flutter/material.dart';
import 'package:nasapic/design_system/themes/custom_colors.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget companyIcon;
  final String title;
  final Widget searchBar;

  const WebAppBar({
    super.key,
    required this.companyIcon,
    required this.title,
    required this.searchBar,
    this.height = 90.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AppBar(
          toolbarHeight: height,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.8,
                child: companyIcon,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: CustomColors.eggPlantTextColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                width: 32,
              ),
              Expanded(
                child: searchBar,
              ),
            ],
          ),
          centerTitle: true,
        );
      },
    );
  }
}
