import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/modules/doctor items/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../models/models.dart';
import '../../../drawer/drawer.dart';
class reveiwitem extends StatefulWidget {
  @override
  State<reveiwitem> createState() => _reveiwitem();
}
class _reveiwitem extends State<reveiwitem> {
   int currentPageIndex = 0;
  var commentController = TextEditingController();

   List<UserData> userDataList = [
     UserData(
       name: 'Mahmoud Ahmed',
       imagePath: 'assets/images/01.jpg',
       description: 'Lorem ipsum dolor sit amet.',
       likes: 150,
       dislikes: 10,
     ),
     UserData(
       name: 'Mourad Ahmed',
       imagePath: 'assets/images/01.jpg',
       description: 'Lorem ipsum dolor sit amet.',
       likes: 120,
       dislikes: 15,
     ),
     // Add more items as needed
   ];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       drawer: drawer(),
       appBar: AppBar(
         leading:icon(icon: Icons.arrow_back_ios),
         title:text(text: 'Den Kuper', color: white, size: 20, weiht: FontWeight.w500),
         actions: [
           icon(icon: Icons.exit_to_app)
         ],
       ),
       body: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Column(
           children: [
             Row(
               children: [
                 image(image: 'assets/images/01.jpg'),
                 widthsized(),
                 Column(
                   children: [
                     text(text: 'Den Kuper', color: Colors.black, size: 20, weiht: FontWeight.w500),
                     hightsized(),
                     Row(
                       children: [
                         text(text:'Graduate of Kasr Al-Aini ' , color: Colors.black, size: 15, weiht: FontWeight.w500)
                       ],
                     ),
                     hightsized(),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             coloricon(color:green,icon: Icons.perm_contact_calendar_outlined),
                             widthsized(),
                             text(text: ' Neurology specialist', color: Colors.black, size: 15, weiht: FontWeight.w500),
                           ],
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Row(
                           children: [
                             coloricon(color: green,icon: Icons.location_on_outlined),
                             widthsized(),
                             text(text: 'Sheikh Zayed', color: Colors.black, size: 15, weiht: FontWeight.w500)
                           ],
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Row(
                           children: [
                             coloricon(color: green,icon: Icons.monetization_on_outlined),
                             widthsized(),
                             text(text: '500 L.E', color: Colors.black, size: 15, weiht: FontWeight.w500)
                           ],
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Row(
                           children: [
                             coloricon(color: green,icon: Icons.phone),
                             text(text: '011235689890', color: Colors.black, size: 15, weiht: FontWeight.w500),
                           ],
                         ),
                       ],
                     ),
                   ],
                 )
               ],
             ),
             hightsized(),
             hightsized(),
             hightsized(),
             ToggleSwitch(
               activeBgColor: [
                 green
               ],
               inactiveBgColor: white,
               dividerColor: white,
               borderColor: [
                 green
               ],
               minWidth: 170.0,
               cornerRadius: 20.0,
               inactiveFgColor: Colors.black,
               initialLabelIndex: 0,
               doubleTapDisable: true, // re-tap active widget to de-activate
               totalSwitches: 2,
               labels: [ 'Review', 'Schedule'],
               onToggle: (index) {
                 setState(() {
                   currentPageIndex = index!;
                 });

                 // تحويل المستخدم إلى الصفحة المناسبة
                 switch (index) {

                   case 1:
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>reveiwitem(
                     ),) ,);
                     break;
                   case 0:
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>Oppointment(
                     ),) ,);
                     break;
                 }
               },
             ),
             hightsized(),
             Expanded(
               child: ListView.builder(
                 itemCount: userDataList.length,
                 itemBuilder: (context, index) {
                   final item = userDataList[index];
                   return Column(
                     children: [
                       Container(
                         color: Colors.white,
                         height: 130,
                         child: Row(
                           children: [
                             smallimage(image: item.imagePath),
                             widthsized(),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   text(text: item.name, color: Colors.black, size: 18, weiht: FontWeight.w500),
                                   SizedBox(height: 5),
                                   text(text: item.description, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                             hightsized(),
                                   Row(
                                     children: [
                                       coloricon(color: green, icon: FontAwesomeIcons.thumbsUp),
                                       text(text: '${item.likes}', color: green, size: 15, weiht: FontWeight.w500),
                                    widthsized(),
                                       coloricon(color: green, icon: FontAwesomeIcons.thumbsDown),
                                       text(text: '${item.dislikes}', color: green, size: 15, weiht: FontWeight.w500),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                 hightsized(),
                     ],
                   );
                 },
               ),
             ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: formfield(
                 controller: commentController,
                 label: 'Write comment',
                 suffix: Icons.send,
                 // Add any necessary validation or functionality
               ),
             ),
           ],
         ),
       ),
     );
   }
}
