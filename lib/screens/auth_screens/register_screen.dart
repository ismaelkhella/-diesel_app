import 'package:flutter/material.dart';
import 'package:watiq/util/helper.dart';

import '../../controller/auth_controller.dart';
import '../../models/user.dart';
import '../../util/strings.dart';
import '../widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  // bool _obscureText = true;
  late TextEditingController _emailTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneTextController;
  // late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    // _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    // _passwordTextController.dispose();
    _nameTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: const Color(0xFFED6522),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: height * 0.12),
          child: Column(
            children: [
              Container(
                height: height * 0.09,
                width: width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image(
                  image: const AssetImage('assets/images/logo2.png'),
                  height: height * 0.064,
                  width: width * 0.0138,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.04),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.99),
                      borderRadius: BorderRadius.circular(29),
                    ),

                    width: width * 0.89,
                    // color: Colors.red,
                    height: height * 0.7,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'لديك حساب بالفعل؟',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login_screen');
                              },
                              child: const Text(
                                'تسجيل دخول!',
                                style: TextStyle(
                                  color: mainColor,
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AppTextField(
                          hintText: 'الإسم بالكامل',
                          hintStyle: const TextStyle(
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff7C7C7C)),
                          suffixIcon: Image.asset('assets/images/profile.png'),
                          color: Colors.transparent,
                          controller: _nameTextController,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        AppTextField(
                          hintText: 'البريد الإلكتروني',
                          hintStyle: const TextStyle(
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff7C7C7C)),
                          suffixIcon: Image.asset('assets/images/mailicon.png'),
                          color: Colors.transparent,
                          controller: _emailTextController,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AppTextField(
                          hintText: 'رقم الجوال',
                          hintStyle: const TextStyle(
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff7C7C7C)),
                          suffixIcon: Image.asset(
                            'assets/images/saflag.png', width: 15,),
                          color: Colors.transparent,
                          controller: _phoneTextController,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        // AppTextField(
                        //   controller: _passwordTextController,
                        //   obscureText: _obscureText,
                        //   hintText: 'الرقم السري',
                        //   hintStyle: const TextStyle(
                        //       fontFamily: fontFamily,
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 14,
                        //       color: Color(0xff7C7C7C)),
                        //   suffixIcon: IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         _obscureText = !_obscureText;
                        //       });
                        //     },
                        //     icon: Icon(_obscureText
                        //         ? Icons.visibility_outlined
                        //         : Icons.visibility_off_outlined,
                        //       color: Colors.grey,),
                        //   ),
                        //   color: Colors.transparent,
                        // ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width * 0.893,
                          height: height * 0.068,
                          decoration: BoxDecoration(
                            color: Color(0xFF32343D),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              await _performRegister();
                            },
                            child: const Text(
                              'دخول',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _performRegister() async {
    if (_checkData()) {
      _activation();
      return true;
    } else {
      return false;
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        // _passwordTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _nameTextController.text.isNotEmpty) {
      return true;
    }
    //TODO: SHOW SNACK BAR
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  User get user {
    User user = User();
    user.id;
    user.name = _nameTextController.text;
    user.mobile = _phoneTextController.text;
    user.email = _emailTextController.text;
    // user.password = _passwordTextController.text;

    return user;
  }

  Future<void> _activation() async {
    bool statas = await AuthApiController().register(context, user: user);
    if (statas) {
      print(statas);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
          // BnScreen(password: _passwordTextController.text,
          //   phon: _emailTextController.text,
          //   currentindex: 0,)));
    }
  }

}
