import 'package:fashsion/on_boarding/persentation/view/onboarding_view.dart';

class OnBoardingModels{
  final String image;
  final String title;
  final String subTitle;
  OnBoardingModels({ required this.title,required this.subTitle, required this.image ,});
}

List<OnBoardingModels> onBoardingList=[
  OnBoardingModels(
      title: 'SIZE PREDICTION',
      subTitle: 'The best way to avoid mistakes in buying clothes through online  '
          'shops. You can check your predictions using this dataset.',
      image: 'assets/images/Group 1057.png',

  ),
  OnBoardingModels(
    title: 'SIZE PREDICTION',
    subTitle: 'The best way to avoid mistakes in buying clothes through online  '
        'shops. You can check your predictions using this dataset.',
    image: 'assets/images/Group 1211.png',

  ),
  OnBoardingModels(
    title: 'RECOMMENDATION COLOR',
    subTitle: 'Find your best neutral colors by holding neutral clothes up to   '
        'your face in a mirror.',
    image: 'assets/images/Group 1196.png',

  ),
  OnBoardingModels(
    title: 'RECOMMENDATION CLOTHS',
    subTitle: 'Our image recognition technology analyzes your photo and '
        'suggests similar clothing styles, making it effortless to recreate ',
    image: 'assets/images/b.png',

  ),
];