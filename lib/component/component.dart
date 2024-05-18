
import 'package:detection/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../models/doctorlist.dart';
Widget logoimage({
  @required image,
})=>Container(
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(
        spreadRadius: 2,
        blurRadius: 10,
        color: Colors.black.withOpacity(0.1),
        offset: Offset(0, 10))
    ],),
    child: Image.asset(image,width: 100,height:130,));
Widget text({@required text, @required color,
 required double size,@required weiht,
  aligment
})
=>Text(text,textAlign: aligment,style: TextStyle(color: color,fontWeight: weiht,fontSize: size,));
Widget formfield({
   type,
  @required controller,
  @required label,
  prefix,
  validate,
  ontap,
  suffix,
  obscure,
  function,
  ispassword=false,
  isClickable = true,
}) =>Container(
height: 56,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
),
  child: TextFormField(
    keyboardType: type,
    enabled: isClickable,
    onTap: ontap,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,labelStyle: TextStyle(color: green),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green)),
     focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: green),
     ),
      prefixIcon: Icon(prefix,color: green,),
      suffixIcon: IconButton(
        onPressed: function,
        icon: Icon(suffix,color: green),
      ),
    ),

    obscureText: ispassword,
  )
);
Widget hightsized(
)=>SizedBox(
  height: 10,
);
Widget matrialbuttom({
  bool iselected=false,
  @required text,required  double
  width,required double size,@required colortext,@required wight,function
})=>Container(
  width:width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color:iselected ?  lightyellow:green  ,
  ),
  child:  MaterialButton(onPressed: function
      ,child:Text(text,style: TextStyle(fontWeight: wight,color:white,fontSize: size),)),
);
Widget textBottom({
  isSelected=true,  @required text,  function,
required color,aligment,
})=> TextButton(onPressed:function,
child: Text(text,textAlign:aligment,style: TextStyle(fontWeight: FontWeight.w500,fontSize:18,
color:color ),
));
Widget likedicon({
  function,@required iconname
})
=>Container(
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(
color: green,
),
),
child: IconButton(onPressed: function, icon:Icon( iconname,color: green,)));
Widget image({
  @required image
})=> Container(
width: 130,
height: 130,
decoration: BoxDecoration(
shape: BoxShape.circle, // تحديد شكل الصورة كدائرة
//عيين لون الخلفية
image: DecorationImage(
image: AssetImage(image), // تحديد مسار الصورة
fit: BoxFit.cover, // تحديد كيفية تناسب الصورة داخل الدائرة
),
),
);
Widget icon({
  @required icon
})=>Icon(icon,color: white,) ;
Widget widthsized()=> SizedBox(
width: 10,
);

Widget coloricon({ required Color color ,icon})=>
    Icon(icon, color: color);
Widget smallimage({@required image})=>Container(
width: 90,
height: 90,
decoration: BoxDecoration(
shape: BoxShape.circle, // تحديد شكل الصورة كدائرة
image: DecorationImage(
image: AssetImage(image),
fit: BoxFit.cover,
),
),
);
Widget  smallmatrialbuttom({
  @required text,required  double
  width,required  double height
,required double size,@required color,@required wight,function
})=>Container(
  height: height,
  width:width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: color,
  ),
  child:  MaterialButton(onPressed: function

      ,child:Text(text,style: TextStyle(fontWeight: wight,color:white,fontSize: size),)),
);

Widget pricent({
  required String Tex, required String precint,@required color
})=>Column(
children: [
hightsized(),
Container(
width: 105,
height: 100,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
color: Colors.white,
),
child:Column(
children: [
hightsized(),
hightsized(),
text(text: Tex, color: Colors.black, size: 17, weiht:FontWeight.w500),
hightsized(),
Container(
width: 80,
height: 40,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
color: color
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
text(text: precint, color: white, size: 18, weiht: FontWeight.w500,aligment: TextAlign.center)
],
),
)
],
),
),
],
);

Widget buildTimeSlot(int index, Function changer, List<bool> time) {
  return InkWell(
    onTap: () {
      changer(index);
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: time[index] ? green: white,
      child: Center(
        child: SizedBox(
          height: 60,
          width: 90,
          child: Center(
            child:text(text:  "09:00 AM", color: Colors.black, size: 15, weiht: FontWeight.bold )
          ),
        ),
      ),
    ),
  );
}
