import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:detection/component/component.dart';
import 'package:detection/models/models.dart';
import 'package:detection/constant/constant.dart';

import 'schedule/schedule.dart';
class DocInfoPage extends StatefulWidget {
  @override
  _DocInfoPageState createState() => _DocInfoPageState();
}
class _DocInfoPageState extends State<DocInfoPage> {
  List<UserData> userDataList = [
    UserData(
      name: 'Mahmoud Ahmed',
      imagePath: 'assets/images/01.jpg',
      description: 'Doctor is very good',
      likes: 150,
      dislikes: 10,
    ),
    UserData(
      name: 'Mourad Ahmed',
      imagePath: 'assets/images/15.jpg',
      description: 'Doctor is average',
      likes: 120,
      dislikes: 15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              child:logoimage(image:"assets/images/doctor3.png" )
              //Image.asset("assets/images/doctor3.png", ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/doctor3.png'),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(text:"Dr. Susan Thomas" , color: Colors.black, size: 20, weiht: FontWeight.bold),
                              text(text:" Neurology - CK Hospital" , color: Colors.black, size: 17, weiht: FontWeight.w500)

                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(text:"About the Doctor" , color: Colors.black, size: 20, weiht: FontWeight.bold),
                            hightsized(),
                            text(text:"Graduate of Kasr Al-Aini,Neurology specialist,Sheikh Zayed," , color: Colors.black, size: 15, weiht: FontWeight.w500),
                          hightsized(),
                            text(text:"Reveiws the Doctor" , color: Colors.black, size: 20, weiht: FontWeight.bold),
                            SizedBox(height: 5),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: userDataList.length,
                              itemBuilder: (context, index) {
                                final item = userDataList[index];
                                return buildReviewItem(item);
                              },
                            ),

                            Container(
                              color: white,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: " Write the comment"),
                              ),
                            ),
                          hightsized(),
                            hightsized(),
    matrialbuttom(text: 'Schudule', width: double.infinity, size: 20, wight: FontWeight.w500,function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Oppointment ()));
    })

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReviewItem(UserData item) {
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
  }
}

