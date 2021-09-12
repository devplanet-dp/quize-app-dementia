import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/signin/signin_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/utils/app_util.dart';
import 'package:quiz_app/utils/device_utils.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final _userTEC = TextEditingController();

  final _pwdTEC = TextEditingController();

  final _emailTEC = TextEditingController();

  final _nameTEC = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                            "ලියාපදිංචි වන්න",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          kVerticalSpace,
                          Text(
                            "කරුණාකර පහත විස්තර පුරවන්න",
                            textAlign: TextAlign.justify,
                          ),
                          kVerticalSpace,
                          AppTextField(
                            hint: 'නම',
                            controller: _nameTEC,
                          ),
                          kVerticalSpace,
                          AppTextField(
                            hint: 'විද්යුත් තැපෑල',
                            controller: _emailTEC,
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
                            isPassword: true,
                          ),
                          kVerticalSpace,
                          AppButton(
                            onTap: () async {
                              if (formKey.currentState.validate()) {
                                Get.to(SignInScreen());
                              }
                            },
                            text: 'ලියාපදිංචි වන්න',
                            isLoading: _isLoading,
                          ),
                          kVerticalSpace,
                          InkResponse(
                            onTap: () {
                              Get.to(SignInScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'දැනටමත් ගිණුමක් තිබේද?  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.white),
                                ),
                                Text('පුරන්න',
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
