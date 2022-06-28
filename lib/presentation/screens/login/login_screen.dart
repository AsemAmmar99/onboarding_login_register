import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onboarding_login_register/constants/screens.dart' as screens;
import 'package:onboarding_login_register/presentation/styles/colors.dart';
import 'package:onboarding_login_register/presentation/widgets/default_button.dart';
import 'package:onboarding_login_register/presentation/widgets/default_outlined_button.dart';
import 'package:onboarding_login_register/presentation/widgets/default_phone_form_field.dart';
import 'package:onboarding_login_register/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_svg.dart';
import '../../widgets/default_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 40.w, bottom: 2.h),
                      child: DefaultText(
                        text: 'Welcome to Happy Life',
                        textAlign: TextAlign.start,
                        color: lightBlack,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultText(text: 'Sign in', fontSize: 25.sp,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DefaultText(text: 'Help ', fontSize: 12.sp, color: Colors.blue,),
                              Icon(Icons.help, color: Colors.blue,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: DefaultText(text: 'Phone Number'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: DefaultPhoneFormField(controller: phoneNumberController, validator: (text){
                        if(phoneNumberController.text.isEmpty){
                          return 'Type your phone number';
                        }else if(phoneNumberController.text.length < 9){
                          return "Phone number can't be less than 9 digits";
                        }
                        return null;
                      },),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: DefaultMaterialButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              Fluttertoast.showToast(
                                  msg: "Login Succeeded!",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: darkBlue,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          },
                          text: 'Sign In',
                          fontWeight: FontWeight.bold,
                          background: darkBlue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Divider(height: 1.h, color: Colors.black45)),
                          DefaultText(text: 'Or', color: lightBlack,),
                          Expanded(child: Divider(height: 1.h, color: Colors.black45)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: DefaultOutlinedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            Fluttertoast.showToast(
                                msg: "Login with Google Succeeded!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: darkBlue,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              DefaultSvg(iconPath: 'assets/google.svg'),
                              SizedBox(width: 10),
                              DefaultText(
                                  text: 'Sign In with Google',
                                  color: darkBlue),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
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
                                Navigator.of(context).pushNamed(screens.REGISTER_SCREEN);
                              }),
                        ],
                      ),
                    ),
                    DefaultText(
                      text: 'Use the application according to policy rules. Any kinds of violations will be subject to sanctions.',
                      textAlign: TextAlign.center,
                      color: lightBlack,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
