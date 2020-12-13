import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final String titleText;
  final String imageAsset;
  final Widget body;

  CalendarItem({
    Key key,
    this.body,
    this.titleText,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double h1 = 70;
    const double h2 = 150;
    const double r = 60;

    Color borderColor = ThemeUtils.ScaffoldBackground;
    Color titleBgColor = ThemeUtils.primaryColor;
    Color bodyBgColor = titleBgColor.withOpacity(0.3);
    Color imageBgColor = Colors.white;
    double borderRadius = 20;
    double borderWidth = 5;

    var card_title = ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      child: Container(
        width: double.infinity,
        height: h1,
        decoration: BoxDecoration(
          color: titleBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        padding: const EdgeInsets.only(
          top: ThemeUtils.defaultPadding,
          bottom: ThemeUtils.defaultPadding,
          right: ThemeUtils.defaultPadding * 2,
          left: r + ThemeUtils.defaultPadding * 2,
        ),
        child: FittedBox(
          alignment: Alignment.centerRight,
          fit: BoxFit.scaleDown,
          child: Text(
            this.titleText,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    var card_body = ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(borderRadius),
        bottomRight: Radius.circular(borderRadius),
      ),
      child: Container(
        width: double.infinity,
        height: h2,
        decoration: BoxDecoration(
          color: bodyBgColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
        padding: EdgeInsets.only(
          top: ThemeUtils.defaultPadding * 2,
          left: ThemeUtils.defaultPadding * 2 + r,
          right: ThemeUtils.defaultPadding * 2,
          bottom: ThemeUtils.defaultPadding * 2,
        ),
        child: FittedBox(
          alignment: Alignment.topLeft,
          fit: BoxFit.scaleDown,
          child: this.body,
        ),
      ),
    );

    var card = Positioned.fill(
      left: r,
      child: Column(
        children: [
          card_title,
          Container(
            width: double.infinity,
            height: borderWidth,
            color: borderColor,
          ),
          card_body,
        ],
      ),
    );

    var image = Positioned(
      top: h1 - r,
      child: Container(
        width: r * 2,
        height: r * 2,
        padding: EdgeInsets.all(ThemeUtils.defaultPadding),
        child: Image.asset(
          imageAsset,
          fit: BoxFit.fitWidth,
        ),
        decoration: BoxDecoration(
            color: titleBgColor,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.all((new Radius.circular(r)))),
      ),
    );

    return Container(
      margin: EdgeInsets.only(bottom: ThemeUtils.defaultPadding),
      child: Stack(
        children: [
          Container(
            height: h1 + h2 + borderRadius,
            color: Colors.transparent,
            width: double.infinity,
          ),
          card,
          image,
        ],
      ),
    );
  }
}
