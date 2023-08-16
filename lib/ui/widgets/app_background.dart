import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/assets_utils.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(AssetsUtils.appBackground, fit: BoxFit.cover,),
        ),
        SafeArea(child: child),
      ],
    );
  }
}