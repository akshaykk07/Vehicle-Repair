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

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.id});
  final id;
  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<String> droplist = ["Fuel leaking", "Engin work", "Tyre alignment"];

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
  void initState() {
    userData();
    super.initState();
  }

  final place = TextEditingController();
  final note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteone,
        appBar: AppBar(
          backgroundColor: offblack,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: whiteone,
            ),
          ),
          title: const AppText(
              text: "Needed service",
              weight: FontWeight.w400,
              size: 20,
              textcolor: whiteone),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('mechanicSignUp')
                            .doc(widget.id)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Text("Error ${snapshot.error}");
                          }
                          final mname = snapshot.data!['username'];
                          mecanicname = mname;
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                                backgroundColor: whiteone,
                                backgroundImage: NetworkImage(
                                    snapshot.data!['profileimage'].toString()),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppText(
                                  text: snapshot.data!['username'],
                                  weight: FontWeight.w400,
                                  size: 16,
                                  textcolor: customBalck),
                              AppText(
                                  text: snapshot.data!['email'],
                                  weight: FontWeight.w400,
                                  size: 14,
                                  textcolor: customBalck),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton1(
                                        icon: Icons.call,
                                        btnname: "call",
                                        btntheam: Colors.greenAccent,
                                        textcolor: offblack,
                                        outline: true,
                                        click: () {
                                          launchUrl(Uri.parse(
                                              'tel:+${snapshot.data!['phone']}'));
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: CustomButton1(
                                        icon: Icons.message_rounded,
                                        btnname: "message",
                                        btntheam: Colors.yellowAccent,
                                        textcolor: offblack,
                                        outline: true,
                                        click: () {
                                          launchUrl(Uri.parse(
                                              'sms:+${snapshot.data!['phone']}'));
                                        }),
                                  )
                                ],
                              ),
                            ],
                          );
                        }),
                    SizedBox(
                      height: 40.h,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                          text: "List your Needed Service here",
                          weight: FontWeight.w500,
                          size: 18,
                          textcolor: offblack),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6).r,
                        border: Border.all(color: offblack),
                        color: white,
                      ),
                      child: DropdownButtonFormField(
                        hint: const Text("Select Service"),
                        padding: EdgeInsets.symmetric(horizontal: 15.h),
                        items: droplist
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          selectedvalue = value as String;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    CustomTextField(
                        hint: "Enter your Exact place",
                        fillcolor: white,
                        controller: place,
                        validator: (value) {
                          if (value!.isNotEmpty && value == null) {
                            return "Enter place";
                          }
                        }),
                    TextFormField(
                      controller: note,
                      validator: (value) {
                        if (value!.isNotEmpty && value == null) {
                          return "Enter note";
                        }
                      },
                      maxLines: 3,
                      cursorColor: customBalck,
                      decoration: InputDecoration(
                          fillColor: white,
                          filled: true,
                          hintText: "Write here",
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: customBalck)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: customBalck),
                              borderRadius: BorderRadius.circular(6).r),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6).r,
                              borderSide:
                                  const BorderSide(color: customBalck))),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        btnname: "Send Request",
                        btntheam: offblack,
                        textcolor: whiteone,
                        click: () {
                          if (formkey.currentState!.validate()) {
                            sendRequest();
                          }
                        })
                  ]),
            ),
          ),
        ));
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      uid = data.getString('id');
      name = data.getString('name');
      mobile = data.getString('phone');
      image = data.getString('profile');
    });
  }

  sendRequest() async {
    await FirebaseFirestore.instance.collection('userRequest').add({
      'location': place.text.trim(),
      'note': note.text.trim(),
      'issue': selectedvalue,
      'mid': widget.id,
      'mname': mecanicname,
      'uid': uid,
      'phone': mobile,
      'username': name,
      'time': time.format(context),
      'date': DateFormat('dd/mm/yy').format(date),
      'status': 0,
      'userprofile': image
    }).then(
        (value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(" Request Succeffuly"),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.yellow,
            )));
    note.clear();
    place.clear();
  }
}
