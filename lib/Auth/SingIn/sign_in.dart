import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Auth/SingUp/filling_page.dart';
import 'package:foody/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isEmailEmpty = false;
  bool isEmailInCorrect = false;
  bool isPasswordEmpty = false;
  bool isPasswordInCorrect = false;
  bool isPasswordValidate = false;
  bool isRemembered = false;
  bool isHide = false;
  bool isDone = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 114),
                child: Image.asset('assets/image/fulllogo.png'),
              ),
              SizedBox(height: 18),
              Text(
                'Sign in to your account',
                style: TextStyle(
                    color: Color(0xff09101D),
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Color(0xff2C3A4B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: email,
                  onChanged: (value) {
                    isEmailEmpty = true;
                    isEmailInCorrect = false;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Email or Phone Number',
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                      ),
                    ),
                  ),
                ),
              ),
              !isEmailEmpty
                  ? Text('Email\'ni to\'ldir')
                  : isEmailInCorrect
                      ? Text('Email xato')
                      : SizedBox.shrink(),
              SizedBox(height: 32),
              Row(
                children: [
                  SizedBox(width: 48),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Color(0xff2C3A4B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  obscureText: !isHide,
                  obscuringCharacter: '*',
                  controller: password,
                  onChanged: (value) {
                    isPasswordEmpty = false;
                    isEmailEmpty = false;
                    isEmailInCorrect = false;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isHide = !isHide;
                        setState(() {});
                      },
                      child: isHide == false
                          ? Icon(
                              Icons.visibility,
                            )
                          : Icon(
                              Icons.visibility_off,
                            ),
                    ),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffEBEEF2),
                      ),
                    ),
                  ),
                ),
              ),
              isPasswordEmpty
                  ? Text('Password kiriting')
                  : isPasswordInCorrect
                      ? Text('Password xato')
                      : SizedBox.shrink(),
              SizedBox(height: 22),
              Row(
                children: [
                  SizedBox(width: 48),
                  GestureDetector(
                    onTap: () {
                      isRemembered = !isRemembered;
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: !isRemembered ? Color(0xffF43F5E) : Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        border: Border.all(
                          color: Color(0xffF43F5E),
                        ),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.white,
                      )),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xff2C3A4B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  if (email.text.isNotEmpty && password.text.isNotEmpty) {
                    isDone = true;
                    if (email.text != email) {
                      // isEmailInCorrect = true;
                      // setState(() {});
                    }
                    if (password.text.length <= 8) {
                      isPasswordValidate = true;
                      setState(() {});
                    }
                  } else if (email.text.isEmpty) {
                    isEmailEmpty = true;
                    setState(() {});
                  } else if (password.text.isEmpty) {
                    isPasswordEmpty = true;
                  }
                  if (isDone) {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      isDone = true;
                      
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (a) => HomePage(),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  // duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: 55,
                  decoration: BoxDecoration(
                    color: !isDone
                        ? Color.fromARGB(138, 244, 63, 93)
                        : Color(0xffFF1843),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Forgot password?',
                style: TextStyle(
                    color: Color(0xffF43F5E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'or continue with',
                style: TextStyle(
                  color: Color(0xff09101D),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 160,
                    height: 57,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(
                          color: Color(0xffF4F6F9),
                          width: 1,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            'assets/image/facebook.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Facebook',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 57,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(
                          color: Color(0xffF4F6F9),
                          width: 1,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            'assets/image/google.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Google',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  SizedBox(width: 80),
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Color(0xff858C94),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (a) => FillingPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xffF43F5E),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
