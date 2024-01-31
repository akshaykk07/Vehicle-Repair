import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/UserNotification.dart';
import 'package:flutter_application_1/Screens/user/edit/mclist.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screenone extends StatefulWidget {
  const Screenone({super.key});

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  List imsges = [
    "assets/tow.png",
    "assets/en.png",
    "assets/Service1.png",
    "assets/tire.png",
    "assets/battery.png",
    "assets/oil.png",
    "assets/wash.png",
    "assets/p.png",
    "assets/repair.png",
  ];

  List services = [
    "Break Down Assist",
    "Engine ",
    "General ",
    "Tyre",
    "Electrical",
    "Oil",
    "Wash",
    "Paint",
    "Others",
  ];

  List img = [
    "assets/banner.jpg",
    "assets/banner2.jpg",
    "assets/banner.jpg",
    "assets/banner.jpg",
  ];

  int currentIndex = 0;
  bool searchbar = false;

  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: whiteone,
        title: const AppText(
            text: "hi, Akshay",
            weight: FontWeight.w500,
            size: 18,
            textcolor: customBalck),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchbar = !searchbar;
                });
              },
              icon: Icon(Icons.search)),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    // got to notification screen.....
                    builder: (context) => const UserNotification(),
                  ));
            },
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications_none_sharp,
                  color: customBalck,
                  size: 30,
                ),
                Positioned(
                    // notification Icon......
                    left: 17.r,
                    top: 5.r,
                    child: CircleAvatar(
                      radius: 6.r,
                      backgroundColor: Colors.red,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      backgroundColor: whiteone,
      body: ListView(

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            searchbar == true
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomTextField(
                        hint: "Search Services",
                        controller: search,
                        validator: (value) {}),
                  )
                : const SizedBox(),
            CarouselSlider(
              items: img
                  .map((e) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: 50.h,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          e,
                          fit: BoxFit.fill,
                        ),
                      )))
                  .toList(),
              options: CarouselOptions(
                height: 160,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            DotsIndicator(
              dotsCount: img.length,
              position: currentIndex,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: customBalck,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const AppText(
                  text: "Popular Services",
                  weight: FontWeight.w400,
                  size: 20,
                  textcolor: customBalck),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => McList(),
                          ));
                    },
                    child: Container(
                      height: 300.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: const Offset(0.0, 3.0)),
                          ],
                          borderRadius: BorderRadius.circular(15).r,
                          color: white),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                imsges[index],
                                width: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppText(
                                  text: services[index],
                                  textcolor: customBalck,
                                  size: 10.sp,
                                  weight: FontWeight.w500),
                            ]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
