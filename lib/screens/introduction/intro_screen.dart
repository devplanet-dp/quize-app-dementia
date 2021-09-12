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
        title:
            "ඔබේ ලකුණු වලින් අදහස් කරන්නේ කුමක්ද?",
        maxLineTitle: 5,
        backgroundColor: kSecondaryColor,
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:"සමීපතමයෙකුට ඩිමෙන්ශියා රෝගය ඇති වූ විට, එම තත්වය ගැන ඔබ කලබලයට පත් විය හැකිය. ඩිමෙන්ශියාව යනු එදිනෙදා ජීවිතයට බලපෑම් කිරීමට තරම් දැඩි මානසික හැකියාවන් පහත වැටීමකි. ඇල්සයිමර් රෝගය යනු ඩිමෙන්ශියා රෝගයේ නිශ්චිත ස්වරූපයකි. ඇල්සයිමර් රෝග ලක්‍ෂණ කාලයත් සමඟ නරක අතට හැරේ. ඩිමෙන්ශියා රෝගීන්ගෙන් ඇල්සයිමර් රෝගය සියයට 60 සිට 80 දක්වා වේ.අප වයසට යත්ම මතකය නැති වීම සාමාන්‍ය දෙයක් වුවද ඇල්සයිමර් රෝගය වයසට යාමේ සාමාන්‍ය කොටසක් නොවේ. තවද, ඇල්සයිමර් රෝගය වැළඳෙන සෑම කෙනෙකුම වයස්ගත නොවේ - ඇත්ත වශයෙන්ම, ඇල්සයිමර් රෝගය ඇති 65,000 හෝ ඊට අඩු ඇමරිකානුවන් 200,000 ක් පමණ සිටිති.\nඇල්සයිමර් රෝගය සහ අනෙකුත් ඩිමෙන්ශියා රෝගයේ ප්‍රධාන රෝග ලක්‍ෂණය නම් මතකය නැති වීමයි. ඇල්සයිමර් රෝගය සමඟ කාලයත් සමඟ මතකය නැති වීම නරක අතට හැරේ. අවසානයේදී, එය ඇති පුද්ගලයාට එදිනෙදා ජීවිතයේ කටයුතු කිරීමට නොහැකි වේ.යමෙකුට මතක ශක්තිය නැති විය හැකි බවට සෞඛ්‍ය සේවා සපයන්නෙකු සැක කරන විට, ඔහුට හෝ ඇයට කුඩා මානසික රාජ්‍ය විභාගය (MMSE) නමින් පරීක්ෂණයක් කළ හැකිය. මෙම පරීක්‍ෂණය ලොව පුරා භාවිතා වන අතර පරිපාලනය කිරීමට පහසු වන අතර පරීක්‍ෂණයේදී මතකය, සාන්ද්‍රණය සහ උපදෙස් පිළිපැදීමේ හැකියාව පිළිබඳව සෞඛ්‍ය සේවා වෘත්තිකයෙකු රෝගියාගෙන් ප්‍රශ්න අසයි.පිළිතුරු ලකුණු කර ඇති අතර එම ලකුණු මඟින් පෙන්නුම් කරන්නේ රෝගියාට ඇති ඩිමෙන්ශියා මට්ටමයි. ඉහළ කෙළවරේ ලකුණු මඟින් ඉහළ සංජානන ක්‍රියාකාරිත්වයක් පෙන්නුම් කරන අතර අඩු ලකුණු ඩිමෙන්ශියා රෝගයේ වඩාත් දරුණු අවස්ථා පෙන්නුම් කරයි.\n ඇල්සයිමර්ස් සංගමයට අනුව, ඇල්සයිමර් රෝගය ඇති අයෙකුට සෑම වසරකම ලකුණු දෙක සිට හතර දක්වා ලකුණු පහළ යාම සාමාන්‍ය දෙයකි.",
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
    slides.add(
        Slide(
          title:
          "ඔබේ ලකුණු ගැන ඔබ බිය විය යුතුද?",
          maxLineTitle: 5,
          backgroundColor: kSecondaryColor,
          styleTitle: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono'),
          description:"යමෙකුට ඩිමෙන්ශියාව ඇත්දැයි තීරණය කිරීමට භාවිතා කරන එකම පරීක්ෂණය මෙය නොවේ. ඇත්ත වශයෙන්ම, සෞඛ්‍ය සේවා සපයන්නන් සාමාන්‍යයෙන් රෝගියෙකුගේ වෛද්‍ය ඉතිහාසය, ශාරීරික පරීක්ෂණ ප්‍රති results ල සහ සමහර විට මොළයේ ස්කෑන් පරීක්ෂණ ඇතුළුව ස්නායු රෝග පරීක්ෂණ ප්‍රතිඵල දෙස බලනු ඇත. මෙම සියලු පියවරයන් සහ MMSE වැනි මානසික තත්ත්‍ව පරීක්‍ෂණයේ ප්‍රතිඵල සමඟ පුද්ගලයෙකුට ඩිමෙන්ශියාව තිබේද යන්න තීරණය කිරීමට සැපයුම්කරුවෙකුට උපකාරී වේ.\nඔබ රැකබලා ගන්නා කෙනෙකු MMSE ලබා ගන්නේ නම්, පරීක්ෂණය ගැනම කරදර විය යුතු නැත. ඔබට එය සමත් වීමට හෝ අසමත් වීමට නොහැකි අතර ඒ සඳහා ඔබට ඉගෙනීමට නොහැකිය. එය බුද්ධි පරීක්‍ෂණයක් ද නොවේ. ඔබේ ආදරණීයයාට අවශ්‍ය වන්නේ හැකි තාක් දුරට ප්‍රශ්න වලට පිළිතුරු දීම පමණි. යමෙකුට ඩිමෙන්ශියාව ඇත්ද යන්න තීරණය කිරීම සඳහා පරීක්‍ෂණය භාවිතා නොකළ යුතුය.",
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
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      hideStatusBar: true,
      onDonePress: () {
        Get.to(SignInScreen());
      },
    );
  }
}
