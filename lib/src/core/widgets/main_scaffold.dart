import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokebook_app_assessment/src/core/shared/image_constants/image_constant.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({this.appBar, this.child, super.key,});

  final PreferredSizeWidget? appBar;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: const BoxConstraints.expand(),
        width: ScreenUtil().screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.kNoiseBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: child,
        ),
      ),
    );
  }
}
