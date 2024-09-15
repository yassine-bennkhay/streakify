import 'package:flutter/material.dart';

class StreakWidget extends StatelessWidget {
  final int numberOfDays;
  final Map<int, bool> isDayTargetReachedMap;
  final Color emptyColor;
  final Color filledColor;
  final double height;
  final double width;
  final void Function(int index)? onTap;
  final int crossAxisCount;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final Axis scrollDirection;
  final ScrollPhysics scrollPhysics;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const StreakWidget({
    super.key,
    required this.numberOfDays,
    required this.isDayTargetReachedMap,
    this.emptyColor = Colors.grey,
    this.filledColor = Colors.green,
    this.height = 100,
    this.width = 400,
    this.onTap,
    this.crossAxisCount = 7,
    this.margin = const EdgeInsets.all(10),
    this.padding = const EdgeInsets.all(10),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderColor,
    this.borderWidth = 1,
    this.scrollDirection = Axis.horizontal,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.mainAxisSpacing = 2,
    this.crossAxisSpacing = 2,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.grey.withOpacity(0.4),
          width: borderWidth,
        ),
        borderRadius: borderRadius,
      ),
      height: height,
      width: width,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        physics: scrollPhysics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: 1,
        ),
        itemCount: numberOfDays,
        itemBuilder: (context, index) {
          final isDayTargetReached = isDayTargetReachedMap[index] ?? false;
          return GestureDetector(
            onTap: () => onTap?.call(index),
            child: Container(
              decoration: BoxDecoration(
                color: isDayTargetReached ? filledColor : emptyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        },
      ),
    );
  }
}
