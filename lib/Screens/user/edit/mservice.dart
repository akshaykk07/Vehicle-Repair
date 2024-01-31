import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Mservice extends StatefulWidget {
  const Mservice({
    super.key,
  });

  @override
  State<Mservice> createState() => _MserviceState();
}

class _MserviceState extends State<Mservice> {
  List<String> service = [
    "Break Down Assist",
    "Engin work",
    "General",
    "Electrical"
  ];

  String? selectedvalue;
  String? uid;
  String? name;
  String? mobile;
  String? image;
  String? mecanicname;
  final formkey = GlobalKey<FormState>();
  final date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  // void initState() {
  //   userData();
  //   super.initState();
  // }

  final place = TextEditingController();
  final note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: whiteone,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white24),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: white,
                  ),
                ),
              ),
            ),
          ),
          // title: const AppText(
          //     text: "Needed service",
          //     weight: FontWeight.w400,
          //     size: 20,
          //     textcolor: whiteone),
          // centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 350,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://feeds.abplive.com/onecms/images/uploaded-images/2024/01/19/8c5617ab5d4a99fe64b5bf83be80252e1d51e.jpg?impolicy=abp_cdn&imwidth=650",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 60.h,
                            width: 500.w,
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10).r,
                              child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: "Rohit Sharma",
                                        weight: FontWeight.w400,
                                        size: 16,
                                        textcolor: white),
                                    AppText(
                                        text: "Rohit@gmail.com",
                                        weight: FontWeight.w400,
                                        size: 16,
                                        textcolor: white),
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppText(
                                  text: "Rating",
                                  weight: FontWeight.w400,
                                  size: 16,
                                  textcolor: customBalck),
                              SizedBox(
                                height: 5.h,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  AppText(
                                      text: "4.5",
                                      weight: FontWeight.w600,
                                      size: 16,
                                      textcolor: customBalck),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const AppText(
                                    text: "Experience",
                                    weight: FontWeight.w400,
                                    size: 16,
                                    textcolor: customBalck),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const AppText(
                                    text: "+2 year",
                                    weight: FontWeight.w600,
                                    size: 16,
                                    textcolor: customBalck)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AppText(
                        text: "Services",
                        weight: FontWeight.w400,
                        size: 16,
                        textcolor: customBalck),
                    SizedBox(
                      height: 10.h,
                    ),
                    Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: service
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8).r,
                                    color: Colors.black12),
                                child: Padding(
                                  padding: const EdgeInsets.all(10).r,
                                  child: AppText(
                                      text: e,
                                      textcolor: offblack,
                                      size: 10.sp,
                                      weight: FontWeight.w500),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AppText(
                        text: "About",
                        weight: FontWeight.w400,
                        size: 16,
                        textcolor: customBalck),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      "Maintains a clean, sanitary, and safe work area and follows all required practices and procedures. Communicates effectively with co-workers to notify them of any problems or concerns that restrict work productivity.",
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                        btnname: "Request",
                        btntheam: offblack,
                        textcolor: white,
                        outline: true,
                        click: () {
                          showModalBottomSheet(
                            backgroundColor: whiteone,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 450,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 20)
                                      .r,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        const AppText(
                                            text: "Down Your Vehicle?",
                                            weight: FontWeight.w500,
                                            size: 28,
                                            textcolor: customBalck),
                                        const AppText(
                                            text: "Fill Your Details!",
                                            weight: FontWeight.w600,
                                            size: 18,
                                            textcolor: customBalck),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          controller: note,
                                          cursorColor: customBalck,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 15.h,
                                                      horizontal: 15.w),
                                              fillColor: white,
                                              filled: true,
                                              hintText:
                                                  "Enter Your Exact Place",
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: customBalck)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: customBalck),
                                                  borderRadius:
                                                      BorderRadius.circular(8)
                                                          .r),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)
                                                          .r,
                                                  borderSide: const BorderSide(
                                                      color: customBalck))),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          controller: note,
                                          validator: (value) {},
                                          cursorColor: customBalck,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 15.h,
                                                      horizontal: 15.w),
                                              fillColor: white,
                                              filled: true,
                                              hintText:
                                                  "Enter Your Vehicle model",
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: customBalck)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: customBalck),
                                                  borderRadius:
                                                      BorderRadius.circular(8)
                                                          .r),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)
                                                          .r,
                                                  borderSide: const BorderSide(
                                                      color: customBalck))),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          controller: note,
                                          maxLines: 3,
                                          cursorColor: customBalck,
                                          decoration: InputDecoration(
                                              fillColor: white,
                                              filled: true,
                                              hintText: "Write Note",
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: customBalck)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: customBalck),
                                                  borderRadius:
                                                      BorderRadius.circular(6)
                                                          .r),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6)
                                                          .r,
                                                  borderSide: const BorderSide(
                                                      color: customBalck))),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        CustomButton(
                                            btnname: "Send Request",
                                            btntheam: offblack,
                                            textcolor: whiteone,
                                            click: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                //sendRequest();
                                              }
                                            }),
                                      ]),
                                ),
                              );
                            },
                          );
                        }),
                    SizedBox(
                      height: 20.h,
                    )
                  ]),
            ),
          ),
        ));
  }

//   userData() async {
//     SharedPreferences data = await SharedPreferences.getInstance();
//     setState(() {
//       uid = data.getString('id');
//       name = data.getString('name');
//       mobile = data.getString('phone');
//       image = data.getString('profile');
//     });
//   }

//   sendRequest() async {
//     await FirebaseFirestore.instance.collection('userRequest').add({
//       'location': place.text.trim(),
//       'note': note.text.trim(),
//       'issue': selectedvalue,
//       'mid': widget.id,
//       'mname': mecanicname,
//       'uid': uid,
//       'phone': mobile,
//       'username': name,
//       'time': time.format(context),
//       'date': DateFormat('dd/mm/yy').format(date),
//       'status': 0,
//       'userprofile': image
//     }).then(
//         (value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text(
//                 "Request Succeffuly",
//                 style: TextStyle(color: customBalck),
//               ),
//               behavior: SnackBarBehavior.floating,
//               backgroundColor: Colors.yellow,
//             )));
//     note.clear();
//     place.clear();
//   }
}
