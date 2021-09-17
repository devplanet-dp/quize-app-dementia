import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      height: context.height,
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            question.type != QuestionType.Remember
                ? Text(
                    question.question,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: kBlackColor),
                  )
                : const SizedBox.shrink(),
            SizedBox(height: kDefaultPadding / 2),
            question.assetPath != null
                ? SizedBox(
                    height: context.height / 5,
                    width: context.width / 2,
                    child: Image.asset(question.assetPath))
                : SizedBox.shrink(),
            _buildAnswerType(question, _controller),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerType(Question question, QuestionController controller) {
    switch (question.type) {
      case QuestionType.Choice:
        return Column(
          children: List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () =>
                  controller.checkAns(question: question, selectedIndex: index),
            ),
          ),
        );
        break;
      case QuestionType.Text:
        return _AnswerTextField(
          question: question,
        );
        break;
      case QuestionType.CheckBox:
        return _AnswerCheckBox(
          question: question,
        );
        break;
      case QuestionType.Remember:
        return _RememberQuestion(
          question: question,
        );
        break;
      default:
        return SizedBox.shrink();
    }
  }
}

class _RememberQuestion extends StatefulWidget {
  final Question question;

  const _RememberQuestion({Key key, this.question}) : super(key: key);

  @override
  __RememberQuestionState createState() => __RememberQuestionState();
}

class __RememberQuestionState extends State<_RememberQuestion> {
  final _formKey = GlobalKey<FormState>();

  final _first = TextEditingController();
  final _second = TextEditingController();
  final _third = TextEditingController();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 2,
      child: PageView(
        // Block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          _buildWords(),
          _buildInputs(),
        ],
      ),
    );
  }

  Widget _buildWords() {
    return Column(
      children: [
        Text(
          'කරුණාකර පහත වචන මතක තබා ගන්න',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: kBlackColor),
        ),
        kVerticalSpace,
        Wrap(
            spacing: 4,
            runSpacing: 2,
            children: List.generate(
                widget.question.options.length,
                (index) => Chip(
                      backgroundColor: kGrayColor,
                      label: Text(
                        widget.question.options[index],
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ))),
        kVerticalSpace,
        ActionChip(
            backgroundColor: kGreenColor,
            label: Text('ඊළඟ',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            onPressed: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn))
      ],
    );
  }

  Widget _buildInputs() {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'ඔබට මතක තබා ගැනීමට ඉල්ලා සිටි වචන ඇතුළත් කරන්න',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: kBlackColor),
                ),
                kVerticalSpace,
                _buildTextField(_first, qnController, 'පළමු වචනය ඇතුළත් කරන්න'),
                kVerticalSpace,
                _buildTextField(
                    _second, qnController, 'දෙවැනි වචනය ඇතුළත් කරන්න'),
                kVerticalSpace,
                _buildTextField(_third, qnController, 'තෙවන වචනය ඇතුළත් කරන්න'),
                kVerticalSpace,
                MaterialButton(
                  color: kGreenColor,
                  minWidth: context.width,
                  height: 50,
                  child: Text('ඉදිරියට යන්න'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      String ans =
                          _first.text + ',' + _second.text + ',' + _third.text;
                      qnController.checkAns(
                          question: widget.question, answer: ans);
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _buildTextField(TextEditingController controller,
          QuestionController qn, String hint) =>
      TextFormField(
        style: TextStyle(color: Colors.black),
        enabled: !qn.isAnswered,
        controller: controller,
        textCapitalization: TextCapitalization.characters,
        keyboardType: null,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: kGrayColor
        ),
        validator: (value) {
          if (value.isNotEmpty) {
            return null;
          }
          return 'කරුණාකර පිළිතුර ඇතුලත් කරන්න';
        },
        maxLines: 1,
      );
}

class _AnswerCheckBox extends StatefulWidget {
  final Question question;

  _AnswerCheckBox({Key key, this.question}) : super(key: key);

  @override
  __AnswerCheckBoxState createState() => __AnswerCheckBoxState();
}

class __AnswerCheckBoxState extends State<_AnswerCheckBox> {
  final _formKey = GlobalKey<FormState>();

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                kVerticalSpace,
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: false,
                  controller: _textController,
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    fillColor: qnController.isAnswered
                        ? qnController.submittedAns == widget.question.answer
                            ? kGreenColor
                            : kRedColor
                        : kGrayColor.withOpacity(0.4),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    }
                    return 'කරුණාකර පිළිතුර ඇතුලත් කරන්න';
                  },
                  maxLines: 10,
                ),
                kVerticalSpace,
                Align(
                  alignment: Alignment.topRight,
                  child: ActionChip(
                    onPressed: () =>
                        !qnController.isAnswered ? _resetField() : null,
                    backgroundColor: kGrayColor,
                    label: Text(
                      'නැවත සකසන්න',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                kVerticalSpace,
                Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  children:
                      List.generate(widget.question.options.length, (index) {
                    return SizedBox(
                      width: 100,
                      child: MaterialButton(
                        minWidth: 100,
                        height: 50,
                        elevation: 2,
                        onPressed: () =>
                            _appendAnswer(widget.question.options[index]),
                        color: kSecondaryColor,
                        child: Text(
                          widget.question.options[index],
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    );
                  }),
                ),
                kVerticalSpace,
                MaterialButton(
                  color: kGreenColor,
                  minWidth: context.width,
                  height: 50,
                  child: Text('ඉදිරියට යන්න'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      qnController.checkAns(
                          question: widget.question,
                          answer: _textController.text);
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  _appendAnswer(String answer) {
    setState(() {
      _textController.text = _textController.text +
          '${_textController.text.isEmpty ? '' : ','}' +
          answer;
    });
  }

  _resetField() {
    setState(() {
      _textController.text = '';
    });
  }
}

class _AnswerTextField extends StatelessWidget {
  final Question question;

  _AnswerTextField({
    Key key,
    this.question,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kVerticalSpace,
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: !qnController.isAnswered,
                  controller: _textController,
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: question.isNumber
                      ? TextInputType.number
                      : TextInputType.text,
                  maxLength: question.maxLength,
                  decoration: InputDecoration(
                    fillColor: qnController.isAnswered
                        ? qnController.submittedAns == question.answer
                            ? kGreenColor
                            : kRedColor
                        : kGrayColor.withOpacity(0.4),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    }
                    return 'කරුණාකර පිළිතුර ඇතුලත් කරන්න';
                  },
                  maxLines: 1,
                ),
                kVerticalSpace,
                MaterialButton(
                  color: kGreenColor,
                  minWidth: context.width,
                  height: 50,
                  child: Text('ඉදිරියට යන්න'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      qnController.checkAns(
                          question: question, answer: _textController.text);
                    }
                  },
                )
              ],
            ),
          );
        });
  }
}
