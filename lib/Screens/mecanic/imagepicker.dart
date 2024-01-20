import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            TextButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('pick image')),
            selectImage != null
                ? SizedBox(
                    height: 300, width: 200, child: Image.file(selectImage!))
                : const Text("select image"),
            ElevatedButton(
                onPressed: () {
                  uploadImage();
                },
                child: Text("save"))
          ]),
    );
  }

  late XFile img;
  pickImage() async {
    img = (await ImagePicker().pickImage(source: ImageSource.camera))!;
    if (img != null) {
      setState(() {
        selectImage = File(img.path);
      });
    } else {
      print("image errror");
    }
  }

  uploadImage() async {
    if (selectImage != null) {
      Reference reference =
          FirebaseStorage.instance.ref().child('profile/${img!.name}');
      await reference.putFile(File(selectImage!.path));
      final imageurl = await reference.getDownloadURL();
    }
  }
}
