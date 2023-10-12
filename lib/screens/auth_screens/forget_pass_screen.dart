import 'package:flutter/material.dart';
import 'package:watiq/util/helper.dart';

import '../../util/strings.dart';
import '../widgets/text_field.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> with Helpers {
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
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_sharp,color: Colors.white,),),
                  Text('نسيت كلمة السر',style: TextStyle(
                    fontSize: 18,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),)
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
                          child: Image.asset('assets/images/mail.png',scale: 1.1,),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        const Center(
                          child: Text('من فضلك فقم بإدخال رقم الجوال الخاص بك',style: TextStyle(
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff434858)
                          ),),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        AppTextField(
                            hintText: 'رقم الجوال',
                            hintStyle: const TextStyle(
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff7C7C7C)),
                            suffixIcon: Image.asset(
                              'assets/images/saflag.png',
                              width: 10,
                            ),
                            color: Colors.transparent,
                            controller: _phoneTextController,
                            textInputType: TextInputType.phone),
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
                              await _performForgetPass();
                            },
                            child: const Text(
                              'تأكيد',
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

  Future<bool> _performForgetPass() async {
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
    // bool statas = await AuthApiController().Login(context,
    //     mobile: _emailTextController.text,
    //     passwor: _passwordTextController.text);
    // if (statas) {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BnScreen( password: _passwordTextController.text, phon:_emailTextController.text, currentindex: 0,)));
  }
}
