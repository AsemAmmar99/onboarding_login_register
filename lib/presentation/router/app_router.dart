import 'package:flutter/material.dart';
import 'package:onboarding_login_register/constants/shared_preferences_keys.dart';
import 'package:onboarding_login_register/constants/screens.dart' as screens;

import '../../data/data_provider/local/cache_helper.dart';
import '../screens/login/login_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/register/register_screen.dart';

class AppRouter{
  late Widget startWidget;

  Route? onGenerateRoute(RouteSettings settings){

    bool? isOnBoarding =
    CacheHelper.getDataFromSP(key: MySharedKeys.IS_ON_BOARDING);
    if (isOnBoarding == true) {
      startWidget = const LoginScreen();
    } else {
      startWidget = const OnBoardingScreen();
    }

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => startWidget);
      case screens.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case screens.REGISTER_SCREEN:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return null;
    }
  }
}