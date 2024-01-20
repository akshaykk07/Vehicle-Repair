import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'AcceptScreen.dart';
import 'RejectScreen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key, required this.id});
  final id;

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

final userdata = FirebaseFirestore.instance.collection('userRequest');

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: whiteone,
          appBar: AppBar(
              backgroundColor: offblack,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20).r,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: whiteone,
                  ),
                ),
              ),
              title: AppText(
                  text: "Requests",
                  weight: FontWeight.w400,
                  size: 20.sp,
                  textcolor: whiteone),
              centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30).r,
            child: Center(
              child: StreamBuilder(
                  stream: userdata.doc(widget.id).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error${snapshot.error}');
                    }

                    return Container(
                      height: 500.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15).r,
                          color: white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 25, bottom: 20)
                            .r,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                  text: snapshot.data!['username'],
                                  weight: FontWeight.w400,
                                  size: 14,
                                  textcolor: customBalck),
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                    height: 350.h,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                              top: 40, bottom: 50, right: 5)
                                          .r,
                                      child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AppText(
                                                text: "Problem",
                                                weight: FontWeight.w400,
                                                size: 14,
                                                textcolor: customBalck),
                                            AppText(
                                                text: "Place",
                                                weight: FontWeight.w400,
                                                size: 14,
                                                textcolor: customBalck),
                                            AppText(
                                                text: "Date",
                                                weight: FontWeight.w400,
                                                size: 14,
                                                textcolor: customBalck),
                                            AppText(
                                                text: "Time",
                                                weight: FontWeight.w400,
                                                size: 14,
                                                textcolor: customBalck),
                                            AppText(
                                                text: "Contact number",
                                                weight: FontWeight.w400,
                                                size: 14,
                                                textcolor: customBalck),
                                          ]),
                                    ),
                                  )),
                                  Expanded(
                                      child: SizedBox(
                                    height: 350.h,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                              top: 40, bottom: 50)
                                          .r,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                                text:
                                                    ": ${snapshot.data!['issue']}",
                                                weight: FontWeight.w500,
                                                size: 14,
                                                textcolor: customBalck),
                                            AppText(
                                                text:
                                                    ": ${snapshot.data!['location']}",
                                                weight: FontWeight.w400,
                                                size: 12,
                                                textcolor: customBalck),
                                            AppText(
                                                text:
                                                    ": ${snapshot.data!['date']}",
                                                weight: FontWeight.w400,
                                                size: 12,
                                                textcolor: customBalck),
                                            AppText(
                                                text:
                                                    ": ${snapshot.data!['time']}",
                                                weight: FontWeight.w400,
                                                size: 12,
                                                textcolor: customBalck),
                                            AppText(
                                                text:
                                                    ": ${snapshot.data!['phone']}",
                                                weight: FontWeight.w400,
                                                size: 12,
                                                textcolor: customBalck),
                                          ]),
                                    ),
                                  )),
                                ],
                              ),
                              snapshot.data!['status'] == 0
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                              btnname: "Accept",
                                              textsize: 15,
                                              height: 40,
                                              btntheam: Colors.green,
                                              textcolor: white,
                                              outline: true,
                                              click: () {
                                                requesAccepted();
                                              }),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                              btnname: "Reject",
                                              textsize: 15,
                                              height: 40,
                                              btntheam: Colors.red,
                                              textcolor: white,
                                              outline: true,
                                              click: () {
                                                requestRejected();
                                              }),
                                        ),
                                      ],
                                    )
                                  : snapshot.data!['status'] == 1
                                      ? CustomButton(
                                          btnname: "Accepted",
                                          height: 40,
                                          textsize: 15,
                                          btntheam: Colors.green,
                                          textcolor: whiteone,
                                          outline: true,
                                          click: () {},
                                        )
                                      : CustomButton(
                                          btnname: "Rejected",
                                          height: 40,
                                          textsize: 15,
                                          btntheam: Colors.redAccent,
                                          textcolor: whiteone,
                                          outline: true,
                                          click: () {},
                                        ),
                            ]),
                      ),
                    );
                  }),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 170).r,
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage("assets/men2.png"),
              ),
            ))
      ],
    );
  }

  requesAccepted() async {
    await FirebaseFirestore.instance
        .collection('userRequest')
        .doc(widget.id)
        .update({'status': 1});
  }

  requestRejected() async {
    await FirebaseFirestore.instance
        .collection('userRequest')
        .doc(widget.id)
        .update({'status': 2});
  }
}
