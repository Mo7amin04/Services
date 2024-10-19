import 'package:flutter/material.dart';
import 'package:services/helper/constants.dart';
import 'package:services/login/FirstPage.dart';
import 'package:services/network/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingModel {
  final String image;
  final String text;
  final Color color;

  OnBordingModel({
    required this.image,
    required this.text,
    required this.color,
  });
}

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  List<OnBordingModel> onbording = [
    OnBordingModel(
        image: "images/5796584937988671374.jpg",
        text: "title1",
        color: Color.fromRGBO(254, 244, 243, 1)), // Adjusted color opacity
    OnBordingModel(
        image: "images/5796584937988671373.jpg",
        text: "title2",
        color: Color.fromRGBO(255, 245, 223, 1)),
    OnBordingModel(
        image: "images/5796584937988671375.jpg",
        text: "title3",
        color: Color.fromRGBO(188, 221, 254, 1)),
  ];

  var isLast = false;
  var controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                if (index == onbording.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: onbording[index].color, // Set background color
                ),
                child: Center(
                  child: Image.asset(
                    onbording[index].image,
                    width: double.infinity,
                    height: double.infinity,
                   // fit: BoxFit.cover, // Adjust this based on your image needs
                  ),
                ),
              ),
              itemCount: onbording.length,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: onbording.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.black87,
                dotColor: Colors.blue,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextButton(
                onPressed: () {
                  if (isLast) {
                    navigateAndFinish(context, FirstPage());
                    CacheHelper.saveData(key: "onBording", value: "true");
                  } else {
                    controller.nextPage(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: Text(!isLast ? "Next" : "Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
