import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TextStyles {

  static truncatedTextBodyStyle(BuildContext context, Color color) {
    return TextStyle(
      letterSpacing: 1.2,
      fontSize: ResponsiveValue(
        context,
        defaultValue: 14.0,
        conditionalValues: [
          Condition.equals(
            name: MOBILE,
            value: 12.0,
          ),
          Condition.smallerThan(
            name: DESKTOP,
            value: 14.0,
          ),
          Condition.equals(
            name: DESKTOP,
            value: 18.0,
          ),
        ],
      ).value,
      overflow: TextOverflow.ellipsis,
      color: color,
    );
  }

  static regularTextStyle(BuildContext context, Color color) {
    return TextStyle(
      letterSpacing: 1.2,
      fontSize: ResponsiveValue(
        context,
        defaultValue: 14.0,
        conditionalValues: [
          Condition.equals(
            name: MOBILE,
            value: 12.0,
          ),
          Condition.smallerThan(
            name: DESKTOP,
            value: 14.0,
          ),
          Condition.equals(
            name: DESKTOP,
            value: 18.0,
          ),
        ],
      ).value,
      color: color,
    );
  }
}