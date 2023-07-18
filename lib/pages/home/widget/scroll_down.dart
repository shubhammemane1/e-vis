
import 'package:evis/values/values.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: SelectableText(
            StringConst.SCROLL_DOWN.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.7,
                ),
          ),
        ),
        const SpaceH16(),
        // Image.asset(
        //   ImagePath.ARROW_DOWN,
        //   height: 24,
        // ),
      ],
    );
  }
}
