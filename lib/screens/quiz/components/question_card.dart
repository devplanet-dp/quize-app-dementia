import 'package:flutter/material.dart';
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
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kBlackColor),
            ),
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
        break;
      default:
        return SizedBox.shrink();
    }
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: TextFormField(
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
                    )),
                Expanded(
                    child: MaterialButton(
                  color: kGreenColor,
                  child: Icon(Icons.arrow_right_alt),
                  shape: CircleBorder(),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      qnController.checkAns(
                          question: question, answer: _textController.text);
                    }
                  },
                ))
              ],
            ),
          );
        });
  }
}
