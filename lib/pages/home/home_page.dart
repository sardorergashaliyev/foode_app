import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foody/components/bottomNavyBar.dart';
import 'package:foody/pages/home/popular_menu.dart';
import 'package:foody/pages/home/popular_res.dart';
import 'package:foody/pages/model/homemodel1.dart';
import 'package:foody/pages/model/homepage2.dart';
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

  List<HomePageModel1> data1 = [
    HomePageModel1(
        image: 'assets/image/pushti.png', title: 'Lovy Food', time: '10 mins'),
    HomePageModel1(
        image: 'assets/image/sariq.png',
        title: 'Cloudy Resto',
        time: '14 mins'),
    HomePageModel1(
        image: 'assets/image/sariq.png', title: 'Lovy Food', time: '11 mins')
  ];

  List<HomePageModel2> data2 = [
    HomePageModel2(
        name: 'Original Salad',
        title: 'Lovy Food',
        image: 'assets/image/vilkali.png',
        price: '\$8'),
    HomePageModel2(
        name: 'Fresh Salad',
        title: 'Cloudy Resto',
        image: 'assets/image/yashilfonda.png',
        price: '\$10'),
    HomePageModel2(
        name: 'Yummie Ice Cream',
        title: 'Circlo Resto',
        image: 'assets/image/oqfonda.png',
        price: '\$6'),
    HomePageModel2(
        name: 'Vegan Special',
        title: 'Haty Food',
        image: 'assets/image/marojna.png',
        price: '\$11'),
    HomePageModel2(
        name: 'Mixed Pasta',
        title: 'Recto Food',
        image: 'assets/image/yashilfonda.png',
        price: '\$13'),
    HomePageModel2(
        name: 'Original Salad',
        title: 'Lovy Food',
        image: 'assets/image/chopakli.png',
        price: '\$8'),
  ];

  int _currentIndex = 0;

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    name = _local.getString("name") ?? "";
    image = _local.getString("image")!;
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
      resizeToAvoidBottomInset: false,
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
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 33, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xffFFB800),
                                    borderRadius: BorderRadius.circular(32)),
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (a) => PopularRes()),
                            );
                          },
                          child: Text(
                            'See all',
                            style: TextStyle(
                                color: Color(0xffF43F5E),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        32.horizontalSpace,
                      ],
                    ),
                    32.verticalSpace,
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data1.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 18),
                            height: 180,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 241),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              children: [
                                32.verticalSpace,
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    data1[index].image,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                24.verticalSpace,
                                Text(
                                  data1[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                8.verticalSpace,
                                Text(
                                  data1[index].time,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    32.verticalSpace,
                    Row(
                      children: [
                        24.horizontalSpace,
                        Text(
                          'Popular Menu',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (a) => PopularMenu()));
                          }),
                          child: Text(
                            'See all',
                            style: TextStyle(
                                color: Color(0xffF43F5E),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        32.horizontalSpace,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        height: 330,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 88,
                              margin: EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 241, 241, 241),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  12.horizontalSpace,
                                  Container(
                                    width: 64,
                                    height: 64,
                                    child: Image.asset(data2[index].image),
                                  ),
                                  20.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      20.verticalSpace,
                                      Text(
                                        data2[index].name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      8.verticalSpace,
                                      Text(
                                        data2[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff858C94),
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    data2[index].price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 29,
                                      color: Color(0xffF43F5E),
                                    ),
                                  ),
                                  32.horizontalSpace,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    32.verticalSpace,
                  ],
                ),
              ),
            ),
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
                  title: Text('Chat'),
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
