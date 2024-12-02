import 'package:flutter/material.dart';

class OnboardingContent {
  final String image, description;
  final Color backgroundColor;

  OnboardingContent( {
    // this adalah untuk menandakan bahwa objek terkait hanya bisa diakses oleh Class terkait
    //atau class yg sebelumnya memanggil class prduct
    required this.image,
    required this.description,
    required this.backgroundColor
  });

}

List<OnboardingContent> onboardingContent = [
  OnboardingContent(
    image: 'assets/images/onboard3.svg', 
    description: 'Personalize Your Mental Health State With AI', 
    backgroundColor:  const Color(0xFFE5EAD6)
  ),
  OnboardingContent(
    image: 'assets/images/onboard1.svg', 
    description: 'Intelligent Mood Tracking Emotion Insights', 
    backgroundColor:  const Color(0xFFEC7D1C)
  ),
  OnboardingContent(
    image: 'assets/images/onboard2.svg', 
    description: 'Mindful Resources That Makes You Happy', 
    backgroundColor:  const Color(0xFFFFEAC1)
  ),
];