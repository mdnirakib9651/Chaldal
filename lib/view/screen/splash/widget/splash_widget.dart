import 'package:flutter/cupertino.dart';

import '../../../../utill/images.dart';

class SplashPrinter extends StatelessWidget {
  const SplashPrinter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Images.splashLogo),
    );
  }
}
