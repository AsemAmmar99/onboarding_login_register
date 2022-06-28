import 'package:flutter/material.dart';
import 'package:onboarding_login_register/constants/screens.dart' as screens;
import 'package:onboarding_login_register/constants/shared_preferences_keys.dart';
import 'package:onboarding_login_register/presentation/styles/colors.dart';
import 'package:onboarding_login_register/presentation/widgets/default_button.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/data_provider/local/cache_helper.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  PageController boardPageController = PageController();

  final List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/onboard_1.gif',
        title: 'Get food delivery to your doorstep asap',
        body: 'We have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
    BoardingModel(
        image: 'assets/onboard_2.gif',
        title: 'Buy Healthy Food from your favorite restaurant',
        body: 'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'),
    BoardingModel(
        image: 'assets/onboard_3.gif',
        title: 'Enjoy!!',
        body: 'We are happy to serve you any time, any place, with all what you need quickly with no extra fees'),
  ];

  void finishOnBoarding(BuildContext context, String screenName) {
    CacheHelper.saveDataToSP(key: MySharedKeys.IS_ON_BOARDING, value: true);
    Navigator.of(context).pushNamed(screenName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blue,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: blue,
          actions: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              decoration: BoxDecoration(
                color: lightBlue,
                  border: Border.all(color: darkBlue),
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(25)),
              ),
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () {
                  finishOnBoarding(context, screens.LOGIN_SCREEN);
                },
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/great.png', height: 4.h,),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boardingList[index]),
                  itemCount: boardingList.length,
                  physics: const BouncingScrollPhysics(),
                  controller: boardPageController,
                  onPageChanged: (int index) {
                    if (index == boardingList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      isLast = false;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: SmoothPageIndicator(
                        controller: boardPageController,
                        count: boardingList.length,
                        effect:  ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: darkBlue,
                          expansionFactor: 4,
                          dotHeight: 10,
                          dotWidth: 2.w,
                          spacing: 5,
                        ),
                      ),
              ),
             DefaultMaterialButton(
                 onPressed: () {
                   finishOnBoarding(context, screens.LOGIN_SCREEN);
                 },
                 text: 'Get Started',
                 fontWeight: FontWeight.bold,
               background: darkBlue,
             ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(text: "Don't have account?", fontSize: 14.sp),
                    DefaultTextButton(
                        child: DefaultText(
                          text: 'Sign Up',
                          fontSize: 14.sp,
                          color: darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () {
                          finishOnBoarding(context, screens.REGISTER_SCREEN);
                        }),
                  ],
                ),
              )
                  ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel boardingListItem) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(boardingListItem.image), fit: BoxFit.contain,)),
        Text(
          boardingListItem.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
         SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            boardingListItem.body,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              color: lightBlack,
            ),
          ),
        ),
      ],
    );
  }
}