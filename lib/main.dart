import 'package:flutter/material.dart';
import 'package:onboarding_login_register/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import 'data/data_provider/local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      }
    );
  }
}