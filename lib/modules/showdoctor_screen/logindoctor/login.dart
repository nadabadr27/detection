import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/layout/detect/detect.dart';
import 'package:detection/layout/doctordetection/doctorgetect.dart';
import 'package:detection/modules/register/Signup/signup.dart';
import 'package:detection/modules/showdoctor_screen/signup/registerdoctor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class logindoctor extends StatefulWidget {
  const logindoctor({super.key});

  @override
  State<logindoctor> createState() => _logindoctorState();
}

class _logindoctorState extends State<logindoctor> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var doctoremailController = TextEditingController();
  var doctorpasswordController = TextEditingController();
  bool ispassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: green,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 45,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:   CrossAxisAlignment.center,
                children: [
                  logoimage(image: 'assets/images/Logo.png'),
                  text(text: 'Alzahimer', color: darkyellow, size: 30, weiht: FontWeight.w900,),
                  text(text: 'Disease', color: white, size: 30, weiht: FontWeight.w900),

                ],
              ),
              hightsized(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                      ,
                      color: white
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top:55,left: 10,right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          formfield(
                            type:TextInputType.emailAddress ,
                            controller: doctoremailController,
                            label: 'e-mail',
                            prefix: Icons.email_outlined,
                            validate:  (value){
                              if (value!.isEmpty) {
                                return 'E-mail is required';
                              }
                              return null;
                            },
                          ),
                          hightsized(),
                          formfield(type: TextInputType.visiblePassword,
                              controller: doctorpasswordController,
                              label: 'password',
                              prefix: Icons.lock,
                              suffix: ispassword?Icons.visibility : Icons.visibility_off,
                              function: () {
                                setState(()
                                {
                                  ispassword = !ispassword;
                                });
                              },
                              ispassword:ispassword  ,
                              validate: ( value)
                              {

                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                  return 'Password must have at least one uppercase letter';
                                }
                                if (!RegExp(r'[a-z]').hasMatch(value)) {
                                  return 'Password must have at least one lowercase letter';
                                }
                                if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return 'Password must have at least one number';
                                }
                                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                  return 'Password must have at least one special character';
                                }
                                return null;
                              }
                          ),
                          hightsized(),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end, // يضمن وضع النص في الجزء السفلي من الزر
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 185,
                                    ),

                                  ],
                                ),
                              ]),

                          hightsized(),
                          hightsized(),
                          hightsized(),
                          hightsized(),
                          matrialbuttom(text: 'Login', width: double.infinity, size: 20, wight: FontWeight.w500,function: (){
                            if(formKey.currentState!.validate()){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>doctorDetect ()
                              ),);
                            }
                            return null;
                          }), hightsized(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(text: "Don't have account", color: Colors.black26, size: 15, weiht: FontWeight.w500),
                              textBottom(text: 'Signup',color: green,function: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>Signupdoctor(
                                ),) ,);
                              }),
                            ],
                          ),hightsized(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(text: 'or connect with', color: Colors.black26, size: 15, weiht: FontWeight.w500),
                              hightsized(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  likedicon(iconname:  FontAwesomeIcons.facebookF),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  likedicon(iconname:  FontAwesomeIcons.google),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  likedicon(iconname:  FontAwesomeIcons.twitter),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
