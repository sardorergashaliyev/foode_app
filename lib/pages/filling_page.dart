import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/pages/payment_method.dart';
import 'package:intl/intl.dart';

class FiilingPage extends StatefulWidget {
  const FiilingPage({super.key});

  @override
  State<FiilingPage> createState() => _FiilingPageState();
}

class _FiilingPageState extends State<FiilingPage> {
  TextEditingController data = TextEditingController();

  Object dropdownvalue = 'Male';

  var item = ['Male', 'Femail'];

  var date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    'Fill in your bio',
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
              //full name
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Color(0xffDA1414),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEBEEF2),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              //nick name
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Nick Name',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Color(0xffDA1414),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEBEEF2),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              // phone number
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Color(0xffDA1414),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEBEEF2),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              //gender
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Gender',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Color(0xffDA1414),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xffEBEEF2),
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEBEEF2),
                          width: 1,
                        ),
                      ),
                    ),
                    value: dropdownvalue,
                    items: item
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (Object? value) {
                      dropdownvalue = value ?? '';
                    },
                  )),
              20.verticalSpace,
              // date of birth
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Date of birth',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Color(0xffDA1414),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: data,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now().add(
                          Duration(days: 365 * 2),
                        )).then(
                      (value) {
                        data.text = DateFormat('MMMM dd, yyyy')
                            .format(value ?? DateTime.now());
                        setState(() {});
                      },
                    );
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(right: 20),
                    suffixIcon: Icon(Icons.calendar_month),
                    filled: true,

                    hintText: data.text,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEBEEF2),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              // address
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Address',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Color(0xffDA1414),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEBEEF2),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (a) => PaymentPage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFF7E95),
                        Color(0xffFF1843),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
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
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
