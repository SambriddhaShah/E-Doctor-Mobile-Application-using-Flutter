import 'package:carousel_slider/carousel_slider.dart';
import 'package:edoctor/utils/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color_utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

int activeIndex = 0;
final controller = CarouselController();
final urlImages = [
  'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
  'https://images.unsplash.com/photo-1535914254981-b5012eebbd15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://revcycleintelligence.com/images/site/article_headers/_normal/2017-12-12-patient-care.png',
  'https://www.healthcareitnews.com/sites/hitn/files/Global%20healthcare_0.jpg'
];

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),
          ),
          const SizedBox(height: 15),
          buildIndicator(),
          const SizedBox(height: 25),
          Text('Doctor Categories',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[280])),
          SizedBox(height: 20),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexStringToColor("2a6f97"),
                    hexStringToColor("61a5c2"),
                    hexStringToColor("a9d6e5"),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        mybutton(
                            iconImagePath: 'images/gyenocology.png',
                            buttonText: 'Gyenocologist',
                            doctor1: 'Dr. Reena Shrestha',
                            doctor2: 'Dr. Smrity Maskey',
                            doctor3: 'Dr. Anju Shrestha',
                            doctor4: 'Dr. Priyanka Tripathi',
                            doctor5: 'Dr. Aparna Shanker Yogacharya',
                            subtext: 'Gyenocologist'),
                        mybutton(
                            iconImagePath: 'images/heart.jpg',
                            buttonText: 'Cardiologist',
                            doctor1: 'Dr. Om Murti Anil',
                            doctor2: 'Dr. Prakash Raj Regmi',
                            doctor3: 'Dr. Rabi Malla',
                            doctor4: 'Dr. Bhagwan Koirala',
                            doctor5: 'Dr. Sachin Dhakal',
                            subtext: 'Cardiologist'),
                        mybutton(
                            iconImagePath: 'images/images.png',
                            buttonText: 'Neurologists',
                            doctor1: 'Dr. J.D Agrawal',
                            doctor2: 'Dr. Ragesh Karna',
                            doctor3: 'Dr. Gopal Raman Sharma',
                            doctor4: 'Dr. Sarvottam Bhatta',
                            doctor5: 'Dr. Damodar Parssad Parajuli',
                            subtext: 'Neurologists'),
                      ],
                    ),
                    const SizedBox(
                      height: 37.748,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        mybutton(
                            iconImagePath: 'images/hepatology.jpg',
                            buttonText: 'Hepatologist',
                            doctor1: 'Dr. Dibas Khadka ',
                            doctor2: 'Dr. Mukesh Sharma Paudel',
                            doctor3: 'Dr. Kunal Bikram Deo',
                            doctor4: 'Dr. Sagar Poudyal',
                            doctor5: 'Dr. Damodar Parssad Parajuli',
                            subtext: 'Hepatologist'),
                        mybutton(
                            iconImagePath: 'images/hematology.jpg',
                            buttonText: 'Hematologist',
                            doctor1: 'Dr. Bisesh Poudyal ',
                            doctor2: 'Dr. Manish Subedi',
                            doctor3: 'Dr. Niraj kumar singh',
                            doctor4: 'Dr. Rabi Ranjan Pardhan',
                            doctor5: 'Dr. Dipendra Prassad Shah',
                            subtext: 'Hematologist'),
                        mybutton(
                            iconImagePath: 'images/general physician.jpg',
                            buttonText: 'General Physician',
                            doctor1: 'Dr. Mahesh Dahal ',
                            doctor2: 'Dr. Reena Shrestha',
                            doctor3: 'Dr. Umid Kumar Shrestha',
                            doctor4: 'Dr. Ganesh Lama',
                            doctor5: 'Dr. Sanjeev Thapa',
                            subtext: 'General Physician'),
                      ],
                    ),
                    const SizedBox(
                      height: 37.748,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        mybutton(
                            iconImagePath: 'images/orthopedics.jpg',
                            buttonText: ' Orthopedist',
                            doctor1: 'Dr. Laxman Sigdel ',
                            doctor2: 'Dr. Manoj Tiwari',
                            doctor3: 'Dr. Rajendra Adhikari',
                            doctor4: 'Dr. Saju Pardhan',
                            doctor5: 'Dr. Shishir Lakhey',
                            subtext: 'Orthopedist'),
                        mybutton(
                            iconImagePath: 'images/Psychiatrists.png',
                            buttonText: ' Psychiatrists',
                            doctor1: 'Dr. Nirakar Man Shrestha ',
                            doctor2: 'Dr. Nirmal Lamichhane',
                            doctor3: 'Dr. Kelison Shrestha',
                            doctor4: 'Dr. Saroj Ojha',
                            doctor5: 'Dr. Surendra Sherchan',
                            subtext: 'Psychiatrists'),
                        mybutton(
                            iconImagePath: 'images/pediatrics.jpg',
                            buttonText: ' Pediatricians',
                            doctor1: 'Dr. Mandeep Gautam ',
                            doctor2: 'Dr. Binay Regmi',
                            doctor3: 'Dr. Kiran Sharma',
                            doctor4: 'Dr. Tekandra Kari',
                            doctor5: 'Dr. Ayat Ali',
                            subtext: 'Pediatricians'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: Color.fromARGB(147, 75, 163, 207)),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Image.network(urlImage, fit: BoxFit.cover);
