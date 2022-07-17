import 'package:flutter/cupertino.dart';

extension NumX on num {
  double getResponsiveWidth(BuildContext context) =>
      (this / 1920) * MediaQuery.of(context).size.width;
}
