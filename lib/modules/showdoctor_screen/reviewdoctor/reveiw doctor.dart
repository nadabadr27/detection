import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../models/models.dart';
class reveiew extends StatefulWidget {
  const reveiew({super.key});
  @override
  State<reveiew> createState() => _reveiewState();
}

class _reveiewState extends State<reveiew> {
  List<UserData> userDataList = [
    UserData(
      name: 'Mahmoud Ahmed',
      imagePath: 'assets/images/01.jpg',
      description: 'doctor  this is good.',
      likes: 150,
      dislikes: 10,
    ),
    UserData(
      name: 'Mourad Ahmed',
      imagePath: 'assets/images/01.jpg',
      description: 'doctor is very bad.',
      likes: 120,
      dislikes: 15,
    ),
    UserData(
      name: 'Mourad Ahmed',
      imagePath: 'assets/images/01.jpg',
      description: 'doctor is very good.',
      likes: 12,
      dislikes: 15,
    ),
    UserData(
      name: 'Mourad Ahmed',
      imagePath: 'assets/images/01.jpg',
      description: 'doctor is very bad.',
      likes: 12,
      dislikes: 15,
    ),
    UserData(
      name: 'Mourad Ahmed',
      imagePath: 'assets/images/01.jpg',
      description: 'doctor is very bad.',
      likes: 12,
      dislikes: 15,
    ),
    // Add more items as needed
  ];
  void addReview(UserData userData) {
    setState(() {
      userDataList.add(userData);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
        ),
        title: Text("Reveiws", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: userDataList.isEmpty
          ? Center(
          child: Text("No reveiw available", style: TextStyle(color: Colors.grey, fontSize: 18))
      )
          : ListView.builder(
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
                              widthsized(),
                              IconButton(
                                icon: Icon(Icons.minimize, color: Colors.black26),
                                onPressed: () {
                                  setState(() {
                                    userDataList.removeAt(index);
                                  });
                                },
                              ),
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
    );
  }


}