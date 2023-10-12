import 'package:flutter/material.dart';
import 'package:watiq/screens/home_screens/home_screen.dart';
import 'package:watiq/shared_pref/shared_pref_controller.dart';

import '../../controller/auth_controller.dart';
import '../../util/helper.dart';
import '../../util/strings.dart';
import '../widgets/text_field.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.phone});

  final String? phone;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> with Helpers {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  int? otp1;
  int? otp2;
  int? otp3;
  int? otp4;
  int? otp5;
  int? otp6;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFED6522),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 20, vertical: height * 0.12),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // physics: const NeverScrollableScrollPhysics(),
            // padding:
            //     EdgeInsets.symmetric(horizontal: 20, vertical: height * 0.06),
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'تأكيد الرقم',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.015),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.99),
                      borderRadius: BorderRadius.circular(29),
                    ),

                    width: width * 0.89,
                    // color: Colors.red,
                    height: height * 0.72,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/phoneicon.png',
                            scale: 1.1,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        const Center(
                          child: Text(
                            'من فضلك فقم بإدخال الكود المرسل الي',
                            style: TextStyle(
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff434858)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        const Center(
                          child: Text(
                            '+966*******25',
                            style: TextStyle(
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff434858)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (width * 0.09),
                              child: TextFormField(
                                autofocus: true,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                onChanged: (String value1) {
                                  setState(() {
                                    otp1 = int.parse(value1);
                                  });
                                  nextField(value1, pin2FocusNode);

                                },
                              ),
                            ),
                            SizedBox(
                              width: (width * 0.09),
                              child: TextFormField(
                                focusNode: pin2FocusNode,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                onChanged: (value2) {
                                  setState(() {
                                    otp2 = int.parse(value2);
                                  });
                                  nextField(value2, pin3FocusNode);

                                },
                              ),
                            ),
                            SizedBox(
                              width: (width * 0.09),
                              child: TextFormField(
                                focusNode: pin3FocusNode,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                onChanged: (value3) {
                                  setState(() {
                                    otp3 = int.parse(value3);
                                  });
                                  nextField(value3, pin4FocusNode);

                                },
                              ),
                            ),
                            SizedBox(
                              width: (width * 0.09),
                              child: TextFormField(
                                  focusNode: pin4FocusNode,
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value4) {
                                    setState(() {
                                      otp4=int.parse(value4);
                                    });
                                    nextField(value4, pin5FocusNode);

                                  }),
                            ),
                            SizedBox(
                              width: (width * 0.09),
                              child: TextFormField(
                                focusNode: pin5FocusNode,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                onChanged: (value5) {
                                  setState(() {
                                    otp5=int.parse(value5);
                                  });
                                  nextField(value5, pin6FocusNode);

                                },
                              ),
                            ),
                            SizedBox(
                              width: (width * 0.09),
                              child: TextFormField(
                                focusNode: pin6FocusNode,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                onChanged: (value6) {
                                  if (value6.length == 1) {
                                    setState(() {
                                      otp6=int.parse(value6);
                                    });
                                    pin6FocusNode!.unfocus();

                                    // Then you need to check is the code is correct or not
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        // AppTextField(
                        //     hintText: 'رقم الجوال',
                        //     hintStyle: const TextStyle(
                        //         fontFamily: fontFamily,
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 14,
                        //         color: Color(0xff7C7C7C)),
                        //     suffixIcon: Image.asset(
                        //       'assets/images/saflag.png',
                        //       width: 10,
                        //     ),
                        //     color: Colors.transparent,
                        //     controller: _phoneTextController,
                        //     textInputType: TextInputType.phone),
                        SizedBox(
                          height: height * 0.03,
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
                              'إرسال',
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
    // if (otp1!=null&& otp2!=null && otp3!=null&&otp4!=null&&otp5!=null&&otp6!=null) {
    return true;
    // }
    //TODO: SHOW SNACK BAR
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> _activation() async {
    bool status = await AuthApiController().verifyOTP(context,
        code: '$otp1$otp2$otp3$otp4$otp5$otp6',
        token: SharedPrefController().token);
    print(status);
    if (status) {
      print('success');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
}}
