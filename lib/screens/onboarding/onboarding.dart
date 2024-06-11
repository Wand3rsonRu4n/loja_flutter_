import 'package:aula_estado/constants/colors.dart';
import 'package:aula_estado/model/onboarding_model.dart';
import 'package:aula_estado/screens/authentication/login.dart';
import 'package:aula_estado/screens/onboarding/dot_indicator.dart';
import 'package:aula_estado/screens/onboarding/onboarding_content.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingContent.length,
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(
                      () {
                        pageIndex = index;
                      },
                    );
                  },
                  itemBuilder: (BuildContext context, int index) =>
                      OnboardingContent(
                    height: height,
                    width: width,
                    title: onboardingContent[index].title,
                    description: onboardingContent[index].description,
                    image: onboardingContent[index].image,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    onboardingContent.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: DotIndicator(
                        activeIndex: pageIndex == index ? true : false,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: height * 0.1,
                    width: 60.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (pageController.page?.round() == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: CircleBorder(),
                      ),
                      child: Text(
                        pageIndex == 2 ? ">" : ">",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
