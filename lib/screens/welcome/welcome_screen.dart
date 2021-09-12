import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/introduction/intro_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AppBg(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(), //2/6
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4)),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: SvgPicture.asset(
                        'assets/icons/ic_logo.svg',
                        color: Colors.white,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "ඩිමෙන්ශියා පරීක්ෂණය",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ඔබ හෝ ඔබේ ඥාතියෙකු හෝ මිතුරන් ඩිමෙන්ශියා රෝගයට ගොදුරු වීමේ වැඩි අවදානමක් ඇත්දැයි දැන ගැනීමට සියලු ප්‍රශ්න සම්පූර්ණ කරන්න",
                    textAlign: TextAlign.justify,
                  ),
                  Spacer(), // 1/6
                  AppButton(
                    onTap: () => Get.to(IntroScreen()),
                    text: 'ආරම්භ කරන්න',
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBg extends StatelessWidget {
  const AppBg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/bg.svg",
      fit: BoxFit.cover,
      width: context.mediaQuerySize.width,
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;

  const AppButton({
    Key key,
    @required this.text,
    @required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.75),
        // 15
        decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.black),
              ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  const AppTextField({
    Key key,
    this.hint,
    this.isPassword = false,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        if (value.isEmpty) {
          return 'කරුණාකර $hint ඇතුලත් කරන්න';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF1C2341),
        hintText: hint ?? '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
