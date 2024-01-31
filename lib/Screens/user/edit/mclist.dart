import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/ServiceScreen.dart';
import 'package:flutter_application_1/Screens/user/edit/mservice.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/mecahnicTile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class McList extends StatefulWidget {
  McList({super.key});

  @override
  State<McList> createState() => _McListState();
}

class _McListState extends State<McList> {
  final search = TextEditingController();

  bool searchbar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      appBar: AppBar(
        backgroundColor: whiteone,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchbar = !searchbar;
                });
              },
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          searchbar == true
              ? CustomTextField(
                  hint: "Search Mechanics",
                  controller: search,
                  validator: (value) {})
              : const SizedBox(),
          const AppText(
              text: "Available Mehanics",
              weight: FontWeight.w400,
              size: 20,
              textcolor: customBalck),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MechanicTilenew(
                    name: "John jacob",
                    mobile: "4.5",
                    service: "Break Down Assist",
                    image:
                        "https://feeds.abplive.com/onecms/images/uploaded-images/2024/01/19/8c5617ab5d4a99fe64b5bf83be80252e1d51e.jpg?impolicy=abp_cdn&imwidth=650",
                    click: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Mservice(),
                          ));
                    });
              },
              itemCount: 5,
            ),
          )
        ]),
      ),
    );
  }
}

class MechanicTilenew extends StatelessWidget {
  const MechanicTilenew({
    super.key,
    required this.name,
    required this.mobile,
    required this.service,
    required this.image,
    required this.click,
  });

  final String image;
  final String name;
  final String mobile;
  final String service;
  final void Function() click;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5.0,
              offset: const Offset(0.0, 3.0)),
        ], color: white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          SizedBox(
            width: 110.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: name,
                        weight: FontWeight.w500,
                        size: 15.sp,
                        textcolor: customBalck),
                    Text(
                      service,
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: customBalck),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow.shade600,
                        ),
                        AppText(
                            text: mobile,
                            weight: FontWeight.w400,
                            size: 14.sp,
                            textcolor: customBalck),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                            ).r,
                            child: CustomButton(
                              btnname: "Book Now",
                              btntheam: white,
                              textcolor: customBalck,
                              click: click,
                              outline: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          )),
        ]),
      ),
    );
  }
}
