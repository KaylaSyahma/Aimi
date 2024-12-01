import 'package:finpro_11/const.dart';
import 'package:finpro_11/ui/onBoarding/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // int quantity = 1;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: onboardingContent[_currentPage].backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  // PageView untuk gambar
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: onboardingContent.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 300),
                        child: SvgPicture.asset(
                          onboardingContent[index].image,
                          height: size.height * 0.3,
                          fit: BoxFit.none,
                        ),
                      );
                    },
                  ),
                  // Image(image: AssetImage('assets/images/onboard1.png')),
                  Container(
                    margin: EdgeInsets.only(
                        top: size.height *
                            0.57), // Adjust margin to make space for the image
                    padding: const EdgeInsets.only(
                      top: defaultPadding,
                      left: 8.0,
                      right: 8.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          // ini buat kayak progress bar nya
                          SizedBox(height: 34),
                          _progressBar(),
                          SizedBox(height: 34,),
                          Text(
                            onboardingContent[_currentPage].description,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: primaryColor),
                              onPressed: () {
                                if (_currentPage < onboardingContent.length - 1) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  // Jika di slide terakhir, arahkan ke halaman lain
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
                    ],
                  ),
          )),
    );
  }

  Row _progressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200, // Total panjang progress bar
          height: 10, // Tinggi progress bar
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.brown, // Warna utama
                Colors.brown.withOpacity(0.4), // Warna memudar
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: (_currentPage + 1) / onboardingContent.length,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown, // Warna isi progress
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
