import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingScreen extends StatefulWidget {
  RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double ratvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: customBalck,
          ),
        ),
        title: const AppText(
            text: "Your rating",
            weight: FontWeight.w400,
            size: 20,
            textcolor: customBalck),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 45, right: 45, top: 10, bottom: 20).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            "assets/men3.png",
            width: 150.w,
            height: 150.h,
            fit: BoxFit.fill,
          ),
          const AppText(
              text: "Name",
              weight: FontWeight.w400,
              size: 16,
              textcolor: customBalck),
          SizedBox(
            height: 15.h,
          ),
          const AppText(
              text: "2+ year experience",
              weight: FontWeight.w400,
              size: 14,
              textcolor: customBalck),
          SizedBox(
            height: 10.h,
          ),
          Card(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: const AppText(
                  text: "Available",
                  weight: FontWeight.w400,
                  size: 12,
                  textcolor: white),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          RatingBar.builder(
            initialRating: ratvalue,
            minRating: 1,
            ignoreGestures: true,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
            unratedColor: Colors.yellow[100],
            itemPadding: const EdgeInsets.symmetric(horizontal: 1),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              (rating);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: AppText(
                text: "Add rating",
                weight: FontWeight.w400,
                size: 16,
                textcolor: customBalck),
          ),
          SizedBox(
            height: 15.h,
          ),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 55,
            unratedColor: customBalck,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1),
            itemBuilder: (context, _) => const Icon(
              Icons.star_border,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              //print(rating);
              setState(() {
                ratvalue = rating;
              });
              print(ratvalue);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 120.h, horizontal: 40.w),
            child: CustomButton(
                btnname: "Submit",
                btntheam: customBlue,
                textcolor: white,
                click: () {}),
          )
        ]),
      ),
    );
  }
}
