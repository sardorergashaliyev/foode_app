import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Auth/SingUp/payment_method.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FillingPage extends StatefulWidget {
  const FillingPage({super.key});

  @override
  State<FillingPage> createState() => _FillingPageState();
}

class _FillingPageState extends State<FillingPage> {
  TextEditingController data = TextEditingController();

  Object dropdownvalue = 'Male';

  var item = ['Male', 'Femail'];

  var date = '';

  Map<String, TextEditingController> controllers = {
    "fullName": TextEditingController(),
    "nickName": TextEditingController(),
    "phoneNumber": TextEditingController(),
    "gender": TextEditingController(),
    "dateOfBirth": TextEditingController(),
    "address": TextEditingController(),
  };

  Map<String, bool> bools = {
    "fullName": false,
    "nickName": false,
    "phoneNumber": false,
    "gender": false,
    "dateOfBirth": false,
    "address": false,
  };

  bool isActive = false;

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
                    'Name',
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
                  controller: controllers['fullName'],
                  onChanged: (value) {
                    bools['fullName'] = false;
                    setState(() {});
                  },
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
              bools['fullName'] == true
                  ? Text('Ismni yozing')
                  : SizedBox.shrink(),
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
                  controller: controllers['nickName'],
                  onChanged: (value) {
                    setState(() {});

                    bools['nickName'] = false;
                  },
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
              bools['nickName'] == true
                  ? Text('Nick name yozing')
                  : SizedBox.shrink(),
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
                  controller: controllers['phoneNumber'],
                  onChanged: (value) {
                    bools['phoneNumber'] = false;
                    setState(() {});
                  },
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
              bools['phoneNumber'] == true
                  ? Text('Telefon raqam yozing')
                  : SizedBox.shrink(),
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
                    hint: Text('Choose'),
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
                      controllers['gender']?.text = value.toString();
                      bools['gender'] = false;
                      setState(() {});
                    },
                  )),
              bools['gender'] == true
                  ? Text('Jinsizni tanlang')
                  : SizedBox.shrink(),
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
                  controller: controllers['dateOfBirth'],
                  onChanged: (value) {
                    bools['dateOfBirth'] = false;
                    setState(() {});
                  },
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate:
                            DateTime.now().subtract(Duration(days: 365 * 2)),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now().subtract(
                          Duration(days: 365 * 2),
                        )).then(
                      (value) {
                        controllers['dateOfBirth']?.text =
                            DateFormat('MMMM dd, yyyy')
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

                    hintText: 'Date of birthday',
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
              bools['dateOfBirth'] == true
                  ? Text('Tugulgan kuningizni kiriting')
                  : SizedBox.shrink(),
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
                  controller: controllers['address'],
                  onChanged: (value) {
                    bools['address'] = false;
                    setState(() {});
                  },
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
              bools['address'] == true
                  ? Text('Manzilingizni yozing')
                  : SizedBox.shrink(),
              20.verticalSpace,
              InkWell(
                onTap: () async {
                  if (!controllers.values
                      .map((e) => e.text.isNotEmpty)
                      .contains(false)) {
                    print('object');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (a) => PaymentPage(),
                      ),
                    );
                    SharedPreferences _store =
                        await SharedPreferences.getInstance();
                    _store.setString("name", controllers['fullName']!.text);
                  } else if (controllers['fullName']!.text.isEmpty) {
                    bools['fullName'] = true;
                  } else if (controllers['nickName']!.text.isEmpty) {
                    bools['nickName'] = true;
                  } else if (controllers['phoneNumber']!.text.isEmpty) {
                    bools['phoneNumber'] = true;
                  } else if (controllers['gender']!.text.isEmpty) {
                    bools['gender'] = true;
                  } else if (controllers['dateOfBirth']!.text.isEmpty) {
                    bools['dateOfBirth'] = true;
                  } else if (controllers['address']!.text.isEmpty) {
                    bools['address'] = true;
                  }
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: !controllers.values
                              .map((e) => e.text.isNotEmpty)
                              .contains(false)
                          ? [
                              Color(0xffFF7E95),
                              Color(0xffFF1843),
                            ]
                          : [
                              Color(0xffFF7E95).withOpacity(0.5),
                              Color(0xffFF7E95).withOpacity(0.5),
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
