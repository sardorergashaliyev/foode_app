import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/components/bottomNavyBar.dart';
import 'package:foody/pages/model/homemodel1.dart';

class PopularRes extends StatefulWidget {

  @override
  State<PopularRes> createState() => _PopularResState();
}

List<HomePageModel1> data = [
  HomePageModel1(
      image: 'assets/image/pushti.png', title: 'Lovy Food', time: '10 mins'),
  HomePageModel1(
      image: 'assets/image/sariq.png', title: 'Cloudy Resto', time: '14 mins'),
  HomePageModel1(
      image: 'assets/image/kok.png', title: 'Circlo Resto', time: '11 mins'),
  HomePageModel1(
      image: 'assets/image/yashil.png', title: 'Haty Food', time: '16 mins'),
  HomePageModel1(
      image: 'assets/image/sariq_yurak.png',
      title: 'Hearthy Resto',
      time: '18 mins'),
  HomePageModel1(
      image: 'assets/image/pushti.png', title: 'Recto Food', time: '15 mins'),
];

class _PopularResState extends State<PopularRes> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image/background_image.png'),
          ),
        ),
        child: Column(
          children: [
            72.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(244, 63, 94, 0.1),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Color.fromRGBO(244, 63, 94, 0.7),
                    ),
                  ),
                ),
                24.horizontalSpace,
                Text(
                  'Popular Restaurant',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
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
            0.verticalSpace,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      childAspectRatio: 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 32),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 241, 241),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70.h,
                            width: 70.w,
                            child: Image.asset(
                              data[index].image,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            data[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          3.verticalSpace,
                          Text(data[index].time),
                          // 24.verticalSpace,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            32.verticalSpace,
            32.verticalSpace,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 12,
            curve: Curves.easeOutCirc,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: Colors.pink),
              BottomNavyBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  title: Text('Order'),
                  activeColor: Colors.pink),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Messege'),
                  activeColor: Colors.pink),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  activeColor: Colors.pink)
            ],
          ),
        ),
      ),
    );
  }
}
