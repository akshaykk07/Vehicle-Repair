import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/serviceTile.dart';

class Services extends StatefulWidget {
  Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final service = TextEditingController();
  @override
  void initState() {
    getMechdata();
    super.initState();
  }

  String? mid;
  String? requesttile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('mechanicService')
              .where('mid', isEqualTo: mid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error${snapshot.error}');
            }
            final user = snapshot.data?.docs ?? [];
            if (!snapshot.hasData) {
              return const Center(
                  child: AppText(
                      text: "Loading...",
                      weight: FontWeight.w500,
                      size: 24,
                      textcolor: customBalck));
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                  child: AppText(
                      text: "No Service Added!",
                      weight: FontWeight.w500,
                      size: 24,
                      textcolor: Colors.grey.shade400));
            }
            return Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, top: 20).r,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final rid = user[index].id;
                    requesttile = rid;
                    return ServiceTile(
                      title: user[index]['services'],
                      click: () {
                        setState(() {
                          user[index].reference.delete();
                        });
                      },
                    );
                  },
                  itemCount: user.length,
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add(context);
        },
        shape: const CircleBorder(),
        backgroundColor: offblack,
        child: const Icon(
          Icons.add,
          color: whiteone,
        ),
      ),
    );
  }

  Future<void> add(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: 330.h,
            width: 300.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: whiteone),
            child: Padding(
              padding: const EdgeInsets.all(20).r,
              child: Padding(
                padding: const EdgeInsets.all(15).r,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Add service",
                          weight: FontWeight.w500,
                          size: 20,
                          textcolor: customBalck),
                      Padding(
                        padding: const EdgeInsets.only(top: 40).r,
                        child: CustomTextField(
                            hint: "service",
                            controller: service,
                            validator: (value) {}),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 40)
                                .r,
                        child: CustomButton(
                            btnname: "Add",
                            btntheam: offblack,
                            textcolor: white,
                            click: () {
                              addService();
                            }),
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }

  addService() async {
    await FirebaseFirestore.instance
        .collection('mechanicService')
        .add({'mid': mid, 'services': service.text.trim()});
    service.clear();
  }

  deleteService() async {
    await FirebaseFirestore.instance.collection('mechanicService').doc();
    service.clear();
  }

  getMechdata() async {
    SharedPreferences mecdata = await SharedPreferences.getInstance();
    setState(() {
      mid = mecdata.getString('id');
    });
  }
}
