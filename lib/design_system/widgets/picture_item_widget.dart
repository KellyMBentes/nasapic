import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/design_system/themes/custom_colors.dart';

class PictureItemWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final DateTime date;
  final VoidCallback onClick;

  const PictureItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Column(children: [
                SizedBox(
                  height: constraints.maxHeight * 0.80,
                  child: image,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '$title \n'),
                                TextSpan(
                                  text: date.toStringRemote(),
                                  style: const TextStyle(
                                    color: CustomColors.khaki,
                                  ),
                                )
                              ],
                            ),
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: CustomColors.eggPlantTextColor,
                                  fontSize: 15,
                                ),
                            maxLines: 4,
                            minFontSize: 0,
                            maxFontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
