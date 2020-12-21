import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final String titleText;
  final String imageAsset;
  final Widget body;
  final bool imageOnLeft;

  CalendarItem({
    Key key,
    this.body,
    this.titleText,
    this.imageAsset,
    this.imageOnLeft = true,
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
        padding: EdgeInsets.only(
          right: !imageOnLeft
              ? (r + ThemeUtils.defaultPadding * 2)
              : ThemeUtils.defaultPadding * 2,
          left: imageOnLeft
              ? (r + ThemeUtils.defaultPadding * 2)
              : ThemeUtils.defaultPadding * 2,
        ),
        child: FittedBox(
          alignment: imageOnLeft ? Alignment.centerRight : Alignment.centerLeft,
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
          bottom: ThemeUtils.defaultPadding * 2,
          left: imageOnLeft
              ? ThemeUtils.defaultPadding + r
              : ThemeUtils.defaultPadding * 2,
          right: !imageOnLeft
              ? ThemeUtils.defaultPadding + r
              : ThemeUtils.defaultPadding * 2,
        ),
        child: DefaultTextStyle(
          child: this.body,
          style: ThemeUtils.cardBodyTextStyle,
        ),
      ),
    );

    var card = Positioned.fill(
      left: this.imageOnLeft ? r : 0,
      right: !this.imageOnLeft ? r : 0,
      child: Column(
        children: [
          card_title,
          Container(
            width: double.infinity,
            height: borderWidth,
            color: imageBgColor,
          ),
          card_body,
        ],
      ),
    );

    var image = Positioned(
      top: h1 - r,
      right: imageOnLeft ? null : 0,
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
