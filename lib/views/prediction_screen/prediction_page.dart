import 'package:disease_symptoms/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:disease_symptoms/views/profile_screen/profile_screen.dart';
import 'package:disease_symptoms/consts/consts.dart';
import 'package:disease_symptoms/widgets_common/bg_widget.dart';
import 'package:disease_symptoms/widgets_common/our_button.dart';

class ResultScreen extends StatelessWidget {
  final String prediction;

  ResultScreen(this.prediction);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Predicted Disease',
            style: TextStyle(
              fontFamily: bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.screenWidth - 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      prediction,
                      style: const TextStyle(
                        fontSize: 36,
                        fontFamily: bold,
                        color: greenThree,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Please read carefully',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: bold,
                        color: redColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'The prediction provided is based on machine learning algorithms, they may not always be accurate and must not be relied upon for making medical decisions.\n\nIt is important to consult with a licensed healthcare professional before taking any actions based on the information provided here.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: semibold,
                        color: greenThree,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 16),
                    ourButton(color: greenThree, title: "Next", textColor: whiteColor, onPress: (){
                      Get.to(()=>Profile());
                    }).box.width(context.screenWidth-40)
                        .make(),
                  ],
                ),
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 65).shadowSm.make(),
            ],
          ),
        ),
      ),
    );
  }
}