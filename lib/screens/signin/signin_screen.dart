import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/signup/signup_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/utils/device_utils.dart';

import '../../constants.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key key}) : super(key: key);

  //keys :-----------------------------------------------------------
  final formKey = GlobalKey<FormState>();

  //text controllers:-----------------------------------------------------------
  final _userTEC = TextEditingController();
  final _pwdTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=>DeviceUtils.hideKeyboard(context),
        child: Stack(
          children: [
            AppBg(),
            SafeArea(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: context.mediaQuerySize.height,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(
                            flex: 2,
                          ), //
                          Text(
                            "පුරන්න",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          kVerticalSpace,
                          Text(
                            "කරුණාකර ඔබේ පරිශීලක නාම මුරපදය ඇතුළත් කරන්න",
                            textAlign: TextAlign.justify,
                          ),
                          kVerticalSpace,
                          AppTextField(
                            hint: 'පරිශීලක නාමය',
                            controller: _userTEC,
                          ),
                          kVerticalSpace,
                          AppTextField(
                              hint: 'රහස් පදය',
                              controller: _pwdTEC,
                              isPassword: true),
                          kVerticalSpace,
                          AppButton(
                            onTap: () {
                              if (formKey.currentState.validate()) {
                                Get.to(QuizScreen());
                              }
                            },
                            text: 'පුරන්න',
                          ),
                          kVerticalSpace,
                          InkResponse(
                            onTap: () {
                              Get.to(SignUpScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'ඔබට ගිණුමක් නැද්ද? ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.white),
                                ),
                                Text('ලියාපදිංචි වන්න',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(color: kGreenColor)),
                              ],
                            ),
                          ),
                          Spacer(flex: 2), // it will take 2/6 spaces
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
