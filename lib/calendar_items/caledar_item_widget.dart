import 'package:flutter/material.dart';

class CalendarItemWidget extends StatelessWidget {
  String titleText = "";
  String imageAsset = "";
  Widget body = Container();
  CalendarItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  //  bottomLeft: Radius.circular(16),
                ),
                child: Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.lightBlue,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      this.titleText,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Container(
              height: 150,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.lightBlue,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        imageAsset,
                        width: 90,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlue,
                            width: 5,
                          ),
                        ),
                        padding: EdgeInsets.all(4),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.topLeft,
                          child: this.body,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
