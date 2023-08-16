import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/models/auth_utility.dart';
import '../utils/assets_utils.dart';
import '../widgets/app_background.dart';
import 'auth/login_screen.dart';
import 'bottom_nav_base_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  
  Future<void> navigateToLogin() async {


    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();

      if(mounted){
        Get.offAll( () => isLoggedIn
            ? const BottomNavBaseScreen()
            : const LoginScreen());

        }
    },);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Center(child: SvgPicture.asset(AssetsUtils.appLogo, width: 100, fit: BoxFit.scaleDown,),),
      ),
    );
  }
}
