import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Auth/SingUp/camera_gallery.dart';
import 'package:foody/pages/model/cardmodel.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<CardModel> data = [
    CardModel(image: 'assets/image/paypal.png'),
    CardModel(image: 'assets/image/visa.png'),
    CardModel(image: 'assets/image/payoneer.png')
  ];

  int counter = 0;
  bool selected = false;
  int index_new = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
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
                  'Payment method',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'This data will be displayed in your account profile for security',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            30.verticalSpace,
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index_new == index) {
                        index_new = -1;
                      } else {
                        index_new = index;
                      }
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 125),
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        border: Border.all(
                          color: index_new == index
                              ? Color(0xffFF1843)
                              : Color(0xffEBEEF2),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Image.asset(data[index].image),
                    ),
                  );
                }),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (index_new != -1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (a) => UploadPhotoPage(),
                    ),
                  );
                }
              },
              child: AnimatedContainer(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color:
                      index_new != -1 ? Color(0xffFF1843) : Color(0xffFF7E95),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                duration: Duration(milliseconds: 300),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            30.verticalSpace
          ],
        ),
      ),
    );
  }
}
