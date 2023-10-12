import 'package:flutter/material.dart';
import 'package:watiq/screens/auth_screens/verify_otp_screen.dart';
import 'package:watiq/util/helper.dart';
import 'package:watiq/util/strings.dart';

import '../../controller/auth_controller.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _phoneTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                padding: EdgeInsets.only(top: height * 0.06),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.99),
                      borderRadius: BorderRadius.circular(29),
                    ),

                    width: width * 0.89,
                    // color: Colors.red,
                    height: height * 0.57,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'دخول',
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
                              'ليس لديك حساب؟',
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
                                    context, '/register_screen');
                              },
                              child: const Text(
                                'إنشاء حساب!',
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
                          height: height * 0.04,
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
                          height: height * 0.04,
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
                        // Container(
                        //   alignment: AlignmentDirectional.topEnd,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       Navigator.pushNamed(
                        //           context, '/forget_pass_screen');
                        //     },
                        //     child: const Text(
                        //       'نسيت كلمة السر؟',
                        //       style: TextStyle(
                        //         color: mainColor,
                        //         fontFamily: fontFamily,
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 13,
                        //       ),
                        //     ),
                        //   ),
                        // ),

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
    if (_phoneTextController.text.isNotEmpty) {
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

  Future<void> _activation() async {
    bool status = await AuthApiController().login(context,
        phone: _phoneTextController.text);
    if (status) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          VerifyOTPScreen(
            phone: _phoneTextController.text,
           )));
    }}
  }
