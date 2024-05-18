import 'package:detection/modules/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:detection/component/component.dart'; // Ensure this file exists
import 'package:detection/constant/constant.dart'; // Ensure this file exists
import 'package:flutter/widgets.dart';
 // Correct path if necessary


// Correct spelling and path if necessary

class UpdateProfileDoctor extends StatefulWidget {
  const UpdateProfileDoctor({super.key});

  @override
  State<UpdateProfileDoctor> createState() => _UpdateProfileDoctorState();
}

class _UpdateProfileDoctorState extends State<UpdateProfileDoctor> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final dateController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  bool ispassword=true;
  bool confirm=true;
  bool old=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer(), // Ensure the correct widget name
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          Icon(Icons.search_rounded)
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
    padding: EdgeInsets.all(15),
    child: GestureDetector(
    onTap: () {
    FocusScope.of(context).unfocus();
    },
    child: ListView(
    children: [

    Center(
    child: Stack(
    children: [
    Container(
    width: 130,
    height: 130,
    decoration: BoxDecoration(
    border: Border.all(
    width: 4,
    color: Theme.of(context).scaffoldBackgroundColor),
    boxShadow: [
    BoxShadow(
    spreadRadius: 2,
    blurRadius: 10,
    color: Colors.black.withOpacity(0.1),
    offset: Offset(0, 10))
    ],
    shape: BoxShape.circle,
    image: DecorationImage(
    fit: BoxFit.cover,
    image: NetworkImage(
    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
    ))),
    ),
    Positioned(
    bottom: 0,
    right: 0,
    child: Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
    width: 4,
    color: green,
    ),
    color: green,
    ),
    child: Icon(
    Icons.edit,
    color:white,
    ),
    )),
    ],
    ),
    ),
              SizedBox(height: 20),
              formfield(
                type:TextInputType.text ,
                controller: nameController,
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
                controller: emailController,
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
                  controller: passwordController,
                  label: 'old password',
                  prefix: Icons.lock,
                  suffix: ispassword?Icons.visibility : Icons.visibility_off,
                  function: () {
                    setState(()
                    {
                     old= !old;
                    });
                  },
                  ispassword:old,

              ),
              hightsized(),
              formfield(type: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: 'new password',
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
                controller: confirmpasswordController,
                label: 'Confirm new password',
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

              hightsized(),
              formfield(
                type:TextInputType.number ,
                controller: phoneController,
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
              // Repeat similar structure for other fields
           hightsized(),
        matrialbuttom(text: 'update profile', width: double.infinity,
          size: 20, wight: FontWeight.w500),
            ],
          ),
        ),
      ),
      )
    );
  }
}
