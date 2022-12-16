import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  String image = "";

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    name = _local.getString("name") ?? "";
    image = _local.getString("image") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background_image.png'),
          ),
        ),
        child: Column(
          children: [
            72.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                SizedBox(
                  height: 42.h,
                  width: 42.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                24.horizontalSpace,
                Text(
                  "Hello, $name",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Icon(Icons.notifications_active, color: Colors.pink),
                24.horizontalSpace
              ],
            ),
            36.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                SizedBox(
                  width: 310.w,
                  height: 45.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF4F6F9),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Color(0xffF4F6F9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Color(0xffF4F6F9)),
                      ),
                    ),
                  ),
                ),
                20.horizontalSpace,
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(244, 63, 94, 0.1),
                  ),
                  child: Icon(Icons.menu, color: Colors.pink),
                )
              ],
            ),
            32.verticalSpace,
            Container(
              height: 180,
              margin: EdgeInsets.only(left: 16, right: 24),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xffFF7E95),
                    Color(0xffFF1843),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 146,
                    height: 140,
                    child: Image.asset('assets/image/burger.png'),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.verticalSpace,
                      SizedBox(
                        width: 150,
                        child: Text(
                          'Special Deal for December',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 23),
                        ),
                      ),
                      32.verticalSpace,
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                        decoration: BoxDecoration(
                            color: Color(0xffFFB800),
                            borderRadius: BorderRadius.circular(32)),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            32.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                Text(
                  'Popular Restaurant',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Spacer(),
                Text(
                  'See all',
                  style: TextStyle(
                      color: Color(0xffF43F5E),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                32.horizontalSpace,
              ],
            )
          ],
        ),
      ),
    );
  }
}
