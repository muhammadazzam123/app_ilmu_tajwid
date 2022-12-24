import 'package:app_ilmu_tajwid/data/question_list.dart';
import 'package:app_ilmu_tajwid/detail_hasil.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class DetailSoal extends StatefulWidget {
  const DetailSoal({Key? key}) : super(key: key);

  @override
  State<DetailSoal> createState() => _DetailSoalState();
}

class _DetailSoalState extends State<DetailSoal> {
  final PageController _controller = PageController(initialPage: 0);

  bool isPressed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: blackColor,
            ),
          ),
        ),
        body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Pertanyaan ${index + 1} /${questions.length}',
                        style: nunitoTextStyle.copyWith(
                          fontWeight: extraBold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      questions[index].question!,
                      style: nunitoTextStyle.copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                  ),
                  const SizedBox(height: 35),
                  for (var i = 0; i < questions[index].answer!.length; i++)
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 18),
                      child: MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                                ? greenColor
                                : redColor
                            : primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  // ignore: avoid_print
                                  print(score);
                                }
                              },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            questions[index].answer!.keys.toList()[i],
                            style: nunitoTextStyle.copyWith(
                                color: whiteColor,
                                fontSize: 15,
                                fontWeight: medium),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          height: 52,
                          minWidth: 188,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          color: primaryColor,
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              (DetailHasil(score)),
                                        ),
                                      );
                                    }
                                  : () {
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                      setState(() {
                                        isPressed = false;
                                      });
                                    }
                              : null,
                          child: Text(
                            index + 1 == questions.length ? 'Result' : 'Next',
                            style: nunitoTextStyle.copyWith(
                                color: blackColor,
                                fontSize: 20,
                                fontWeight: extraBold),
                          )),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
