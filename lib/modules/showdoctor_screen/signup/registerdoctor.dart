import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/modules/register/lodin/login.dart';
import 'package:detection/modules/showdoctor_screen/logindoctor/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signupdoctor extends StatefulWidget {
  const Signupdoctor({super.key});

  @override
  State<Signupdoctor> createState() => _SignupdoctorState();
}

class _SignupdoctorState extends State<Signupdoctor> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var doctoremailController = TextEditingController();
  var doctorpasswordController = TextEditingController();
  var doctorconfirmpasswordController = TextEditingController();
  var doctordateController = TextEditingController();
  var doctphoneController = TextEditingController();
  var doctornameController = TextEditingController();
  bool ispassword=true;
  bool confirm=true;
  String dropvalue='User';
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: green,
        body: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.only(top: 30),
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
                                borderRadius: BorderRadius.circular(20),
                                color: white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:45,left: 10,right: 10),
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      formfield(
                                        type:TextInputType.text ,
                                        controller: doctornameController,
                                        label: 'Name',
                                        prefix: Icons.person,
                                        validate:  (value){
                                          if (value == null || value.isEmpty&&value.length <= 2) {
                                            return 'Name must be more than two characters';
                                          }
                                          return null;
                                        },
                                      ),
                                      hightsized(),
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
                                      formfield(type: TextInputType.visiblePassword,
                                        controller: doctorconfirmpasswordController,
                                        label: 'Confirm password',
                                        prefix: Icons.lock,
                                        suffix: confirm?Icons.visibility : Icons.visibility_off,
                                        function: () {
                                          setState(()
                                          {
                                            confirm = !confirm;
                                          });
                                        },
                                        ispassword:confirm  ,
                                        validate: ( value)
                                        {
                                          if(value!.isEmpty)
                                          {
                                            return 'confirm password is required';
                                          }
                                          return null;
                                        },
                                      ),
                                      hightsized(),
                                      formfield(
                                        type:TextInputType.datetime ,
                                        controller: doctordateController,
                                        label: 'Date',
                                        prefix: Icons.date_range_outlined,
                                        validate:  (value){
                                          if (value!.isEmpty) {
                                            return 'Date must not be empty';
                                          }
                                          return null;
                                        },
                                      ),
                                      hightsized(),
                                      formfield(
                                        type:TextInputType.number ,
                                        controller:doctphoneController,
                                        label: 'phone',
                                        prefix: Icons.phone,
                                        validate:  (value){
                                          if (value == null || value.isEmpty) {
                                            return 'Phone is required';
                                          }else if (value.length != 11) {
                                            return 'Phone number must be 11 characters long';
                                          }; return null;
                                        },
                                      ),

                                      hightsized(),

                                      hightsized(),
                                      matrialbuttom(text: 'Register now', width: double.infinity,
                                          size: 20, wight: FontWeight.w500,function: (){
                                            if(formKey.currentState!.validate()){
                                              Navigator.push(context,MaterialPageRoute(builder: (context)=>login()
                                              ),);
                                            }
                                            return null;
                                          }),
                                      hightsized(),
                                      hightsized(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          text(text: 'Already have an account?', color: Colors.black26, size: 15, weiht: FontWeight.w500),
                                          textBottom(text: 'login', color: green,function: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>logindoctor(
                                            ),) ,);
                                          }),
                                        ],),

                                    ],)
                              )
                              ,)
                        )
                    )

                  ])
          ),
        )
    );
  }
}
