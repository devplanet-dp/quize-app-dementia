import 'package:quiz_app/utils/app_util.dart';

enum QuestionType {
  Choice,
  Text,
  CheckBox,
  Remember,
}

class Question {
  final int id;
  final dynamic answer;
  final String question;
  final List<String> options;
  final QuestionType type;
  final String assetPath;
  final bool isNumber;
  final int maxLength;

  Question({
    this.type,
    this.id,
    this.question,
    this.answer,
    this.options,
    this.assetPath,
    this.isNumber = false,
    this.maxLength = 5,
  });
}

List<Question> sampleQuestions = [
  Question(
      type: QuestionType.Text,
      isNumber: true,
      id: 1,
      question: 'ඔබගේ වයස සදහන් කරන්න ?',
      answer: '24',
      options: ['චීනය', 'ඉන්දියාව', 'එංගලන්තය', 'ශ්‍රී ලංකාව']),
  Question(
      type: QuestionType.Choice,
      isNumber: true,
      id: 1,
      question: 'ස්ත්රී පුරුෂ භාවය',
      answer: -1,
      options: ['පිරිමි', 'ගැහැණු']),
  Question(
      type: QuestionType.Choice,
      isNumber: true,
      id: 1,
      question: 'ඔබේ අධ්‍යාපන මට්ටම කුමක්ද?',
      answer: 1,
      options: [
        'ප්‍රාථමික අධයාපනය හදරා ඇත',
        'අපොස සාමන්ය පෙල දක්වා හදරා ඇත',
        'අපොස උසස් පෙල දක්වා හදරා ඇත',
        'උපාධිය හෝ ඊට සමාන මට්ටම අධයාපනය හදරා ඇත',
        'ශාස්ත්‍රපති හෝ සමාන මට්ටම හෝ ඊට ඉහළ අධයාපනය හදරා ඇත'
      ]),
  Question(
      type: QuestionType.Remember,
      isNumber: true,
      id: 1,
      question: 'කරුණාකර පහත වචන මතක තබා ගන්න',
      answer: 'saman,kumara,42,kurunegala,bottle',
      options: ['Saman', 'Kandy', '42']),
  Question(
      type: QuestionType.CheckBox,
      id: 1,
      question: 'අවුරුද්දේ මාස ප්‍රතිලෝම අනුපිළිවෙලට තෝරන්න?',
      answer:
          'December,November,October,September,August,July,June,May,April,March,February,January',
      options: [
        'April',
        'January',
        'May',
        'September',
        'December',
        'February',
        'June',
        'August',
        'October',
        'March',
        'July',
        'November'
      ]),
  Question(
      type: QuestionType.Choice,
      id: 1,
      question: 'ඔබ ජීවත් වන්නේ කුමන රටේද?',
      answer: 3,
      options: ['චීනය', 'ඉන්දියාව', 'එංගලන්තය', 'ශ්‍රී ලංකාව']),
  Question(
      type: QuestionType.Text,
      id: 1,
      question: '10 සිට 1 දක්වා පසුපසට ගණන් කරන්න',
      answer: '10987654321',
      maxLength: 11,
      isNumber: true),
  Question(
    type: QuestionType.Text,
    id: 1,
    question: 'පහත වචනය පසුපසට ටයිප් කරන්න : WORLD',
    answer: 'dlrow',
  ),
  Question(
    type: QuestionType.Choice,
    id: 1,
    question: 'මේ කුමන මාසයද?',
    options: ['ජනවාරි', 'මාර්තු', 'සැප්තැම්බර්', 'නොවැම්බර්'],
    answer: 2,
  ),
  Question(
    type: QuestionType.Choice,
    id: 1,
    question: 'අද දවස කුමක්ද?',
    options: [
      AppUtil.getDayFormat(DateTime.now()),
      AppUtil.getDayFormat(DateTime.now().add(const Duration(days: 1))),
      AppUtil.getDayFormat(DateTime.now().add(const Duration(days: 2))),
      AppUtil.getDayFormat(DateTime.now().add(const Duration(days: 4)))
    ],
    answer: 0,
  ),
  Question(
    type: QuestionType.Choice,
    id: 1,
    question: 'වත්මන් වර්ෂය කුමක්ද?',
    options: ['2022', '2019', '2021', '2018'],
    answer: 2,
  ),
  Question(
    type: QuestionType.Choice,
    id: 1,
    question: 'අද දිනය කවදාද?',
    options: ['1', DateTime.now().day.toString(), '30', '9'],
    answer: 1,
  ),
  Question(
      type: QuestionType.Choice,
      id: 2,
      question: 'මේ කුමක් ද?',
      answer: 2,
      assetPath: 'assets/icons/img_pencil.jpg',
      options: ['පෑන', 'සැරයටිය', 'පැන්සල', 'බුරුසුව']),
  Question(
      type: QuestionType.Choice,
      id: 3,
      question: 'මේ කුමක් ද?',
      answer: 3,
      assetPath: 'assets/icons/img_watch.jpg',
      options: ['ඔරලෝසුව', 'දුරකථන', 'කාල ගණකය', 'අත් ඔරලෝසුව']),
];
