import 'package:flutter/material.dart';
import '../Constants/ColorThemes.dart';

class Utils {
  Widget getChatBottomTiles(int value, BuildContext context) {
    switch (value) {
      case 0:
        return buildText(context, 'Jan');
      case 1:
        return buildText(context, 'Feb');
      case 2:
        return buildText(context, 'Mar');
      case 3:
        return buildText(context, 'Apr');
      case 4:
        return buildText(context, 'May');
      case 5:
        return buildText(context, 'Jun');
      case 6:
        return buildText(context, 'Jul');
      case 7:
        return buildText(context, 'Aug');
      case 8:
        return buildText(context, 'Sep');
      case 9:
        return buildText(context, 'Oct');
      case 10:
        return buildText(context, 'Nov');
      case 11:
        return buildText(context, 'Dec');
    }
    return buildText(context, '');
  }

  SizedBox buildText(BuildContext context, String string) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 08),
        child: Text(
          string,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
