import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/Auth/SingUp/congrats_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({super.key});

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  final ImagePicker _picker = ImagePicker();
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.18, vertical: 8.18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(9.82)),
                          color: Color.fromARGB(255, 234, 175, 194)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffF43F5E),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Upload your photo',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Text(
                'This data will be displayed in your account profile for security',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            24.verticalSpace,
            imagePath.isEmpty
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding: EdgeInsets.only(
                            left: 100, right: 100, top: 23, bottom: 23),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(-0, 1),
                                  color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            border: Border.all(color: Color(0xffEBEEF2))),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final XFile? photo = await _picker
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) async {
                                  if (value != null) {
                                    CroppedFile? cropperImage =
                                        await ImageCropper()
                                            .cropImage(sourcePath: value.path);
                                    imagePath = cropperImage!.path ;
                                    setState(() {});
                                  }
                                });
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 234, 175, 194)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: Icon(
                                  Icons.photo_camera,
                                  color: Color(0xffFF1843),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'Take photo',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding: EdgeInsets.only(
                            left: 100, right: 100, top: 23, bottom: 23),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(-0, 1),
                                  color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            border: Border.all(color: Color(0xffEBEEF2))),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final XFile? image = await _picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) async {
                                  if (value != null) {
                                    CroppedFile? cropperImage =
                                        await ImageCropper()
                                            .cropImage(sourcePath: value.path);
                                    imagePath = cropperImage!.path;
                                    setState(() {});
                                  }
                                });
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 234, 175, 194)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: Icon(
                                  Icons.folder,
                                  color: Color(0xffFF1843),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From gallery',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            24.verticalSpace,
            imagePath.isEmpty
                ? SizedBox.shrink()
                : Stack(
                    children: [
                      Container(
                        height: 250.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(
                                  File(imagePath),
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              showCupertinoDialog(
                                context: context,
                                builder: ((context) => CupertinoAlertDialog(
                                      title: Text('Choose'),
                                      actions: [
                                        CupertinoButton(
                                            onPressed: (() async {
                                              _picker
                                                  .pickImage(
                                                      source:
                                                          ImageSource.camera)
                                                  .then((value) async {
                                                if (value != null) {
                                                  CroppedFile? _cropperImage =
                                                      await ImageCropper()
                                                          .cropImage(
                                                              sourcePath:
                                                                  value.path);
                                                  if (_cropperImage != null) {
                                                    imagePath =
                                                        _cropperImage.path;
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  }
                                                }
                                              });
                                            }),
                                            child: Text("Take photo")),
                                        CupertinoButton(
                                            onPressed: (() async {
                                              _picker
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery)
                                                  .then((value) async {
                                                if (value != null) {
                                                  CroppedFile? _cropperImage =
                                                      await ImageCropper()
                                                          .cropImage(
                                                              sourcePath:
                                                                  value.path);
                                                  if (_cropperImage != null) {
                                                    imagePath =
                                                        _cropperImage.path;
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  }
                                                }
                                              });
                                            }),
                                            child: Text("From Gallery")),
                                        CupertinoButton(
                                            onPressed: (() async {
                                              imagePath = '';
                                              Navigator.pop(context);
                                              setState(() {});
                                            }),
                                            child: Text('Delete')),
                                        CupertinoButton(
                                            onPressed: (() async {
                                              Navigator.pop(context);
                                            }),
                                            child: Text('Cancel'))
                                      ],
                                    )),
                              );
                            },
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color(0xffF43F5E),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8.r),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () async {
                  if (imagePath.isNotEmpty) {
                    SharedPreferences _local =
                        await SharedPreferences.getInstance();
                    _local.setString("image", imagePath);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: ((context) => CongratsPage()),
                        ), ((route) {
                      return false;
                    }));
                  }
                },
                child: AnimatedContainer(
                  height: 55.h,
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    color: imagePath.isEmpty
                        ? Color.fromARGB(244, 235, 134, 164)
                        : Color(0xffFF1843),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            48.verticalSpace,
          ],
        ),
      ),
    );
  }
}
