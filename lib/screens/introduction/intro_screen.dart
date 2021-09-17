import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/signin/signin_screen.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      Slide(
        title: "",
        maxLineTitle: 1,
        backgroundColor: kSecondaryColor,
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "මුල් අවධියේදී ඩිමෙන්ශියා රෝග ලක්‍ෂණ හඳුනා ගැනීමට මෙම යෙදුම භාවිතා කෙරේ. ඩිමෙන්ශියා රෝග ලක්‍ෂණ නිශ්චය කිරීම සඳහා ක්‍රියාකාරී හා සාමූහික ප්‍රදේශ ආශ්‍රිතව ප්‍රශ්න මාලාවක් ලබා දෙනු ඇත.\n\nඅවසානයේදී, ඕනෑම ඩිමෙන්ශියා ගති ලක්ෂණයක් පෙන්නුම් කරන ලකුණු පෙන්නුම් කෙරේ. මෙම යෙදුම රෝගියාට සහ රැකබලා ගන්නන්ට එකසේ ගැලපේ.\n",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(Slide(
      title: "",
      maxLineTitle: 1,
      backgroundColor: kSecondaryColor,
      styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono'),
      description:
          "මෙය වාණිජ නොවන භාවිතය සඳහා වන අතර පර්යේෂණ කටයුතු සඳහා පමණක් භාවිතා කෙරේ. මෙම යෙදුම සාමාන්‍ය ජනතාවට සාමාන්‍ය අවධියේදී ඩිමෙන්ශියාව හඳුනා ගැනීමට උපකාරී වේ. ප්‍රතිකාර සඳහා වෛද්‍ය කාර්ය මණ්ඩලයට ඩිමෙන්ශියාව කලින් හඳුනා ගැනීම ඉතා උපකාරී වේම\n\nෙම පර්යේෂණ යෙදුම පශ්චාත් උපාධි වැඩසටහන සඳහා ගොඩනඟන ලද්දකි.\n\n",
      styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway'),
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
      directionColorBegin: Alignment.topLeft,
      directionColorEnd: Alignment.bottomRight,
      onCenterItemPress: () {},
    ));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      hideStatusBar: false,
      onDonePress: () {
        Get.off(SignInScreen());
      },
    );
  }
}
