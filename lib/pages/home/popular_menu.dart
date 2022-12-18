import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/components/bottomNavyBar.dart';
import 'package:foody/pages/model/homepage2.dart';

class PopularMenu extends StatefulWidget {
  PopularMenu({super.key});

  @override
  State<PopularMenu> createState() => _PopularMenuState();
}

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

class _PopularMenuState extends State<PopularMenu> {
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
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data2.length,
                  itemBuilder: (BuildContext context, index) {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
