import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../widgets/apptext.dart';
import '../../widgets/ratingTile.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const AppText(
              text: "The rating given to you",
              weight: FontWeight.w400,
              size: 10,
              textcolor: Colors.grey),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10).r,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return RatingTile(
                      image: "assets/men.png",
                      name: "name",
                      work: 'engine work',
                      date: 'date',
                      time: 'time',
                      place: 'place');
                },
                itemCount: 2,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
