import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    double percentage =
        _qnController.numOfCorrectAns / _qnController.questions.length;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SingleChildScrollView(
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3),
                    CircularPercentIndicator(
                      radius: context.width / 2,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: percentage,
                      center: Text(
                        '${(percentage * 100).toInt()}%',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.white.withOpacity(.2),
                      progressColor: kGreenColor,
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: kSecondaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding / 2),
                        child: Text(
                          _getStatus((percentage * 100).toInt()),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(),
                    // AppButton(
                    //   onTap: () => Get.to(QuizScreen()),
                    //   text: 'නැවත උත්සාහ කරන්න',
                    // ),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getStatus(int noCorrectAns) {
    if (noCorrectAns >= 0 && noCorrectAns <= 25) {
      return 'ඔබේ ලකුණු මත පදනම්ව, ඔබේ මානසික සෞඛ්‍යය පිළිබඳ සායනික තක්සේරුවක් ලබා ගැනීම සඳහා ඔබ වෛද්‍යවරයෙකු හමුවීම නිර්දේශ කෙරේ';
    } else if (noCorrectAns >= 25 && noCorrectAns <= 50) {
      return 'ඔබේ ලකුණු මත පදනම්ව,ඔබට මධ්‍යස්ථ ඩිමෙන්ශියා රෝග ලක්‍ෂණ තිබේ. වෛද්යවරයෙකු හමුවීම නිර්දේශ කරයි';
    } else if (noCorrectAns >= 50 && noCorrectAns <= 75) {
      return 'ඔබේ ලකුණු මත පදනම්ව,ඔබට ඩිමෙන්ශියා රෝග ලක්‍ෂණ කිහිපයක් තිබේ. වෛද්යවරයෙකු හමුවීම නිර්දේශ කරයි';
    } else {
      return 'ඔබේ ලකුණු මත පදනම්ව, ඔබ සාමාන්‍යයි. වෛද්යවරයෙකු හමුවීම නිර්දේශ නොකරයි';
    }
  }
}
