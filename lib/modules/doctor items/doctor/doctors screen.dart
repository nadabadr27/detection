import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/modules/doctor%20items/doctorinformation.dart';
import 'package:detection/modules/drawer/drawer.dart';
import 'package:flutter/material.dart';
class Doctor {
  final String name;
  final String imageUrl;
  final double rating;

  Doctor({required this.name, required this.imageUrl, required this.rating});
}

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final List<Doctor> doctors = [
    Doctor(name: "Alex Smith", imageUrl: "assets/images/doctor2.png", rating: 5.0),
    Doctor(name: "John Doe", imageUrl: "assets/images/doctor4.png", rating: 4.8),
    Doctor(name: "Dr. Frasier Crane", imageUrl: "assets/images/doctor2.png", rating: 4.5),
    Doctor(name: "Dr. Gregory", imageUrl: "assets/images/doctor4.png", rating: 4.0),
    Doctor(name: "Alex Smith", imageUrl: "assets/images/doctor2.png", rating: 3.5),
    Doctor(name: "John Doe", imageUrl: "assets/images/doctor4.png", rating: 3.0),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: (doctors.length / 2).ceil(),
        itemBuilder: (context, index) {
          int firstIndex = index * 2;
          int secondIndex = firstIndex + 1;
          return Row(
            children: [
              _buildDoctorCard(doctors[firstIndex]),
              if (secondIndex < doctors.length) _buildDoctorCard(doctors[secondIndex]),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                coloricon(color: darkyellow,icon: Icons.star),

                SizedBox(width: 4),
                text(text: "${doctor.rating}", color:Colors.black, size: 16, weiht: FontWeight.w500)
              ],
            ),
            Image.asset(doctor.imageUrl, height: 100),
            text(text: doctor.name, color: Colors.black, size: 17, weiht:FontWeight.bold ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: green, // Text color
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>DocInfoPage()));
                },
                // إضافة الوظيفة المناسبة
                child:text(text: "Book", color: white, size: 15, weiht: FontWeight.w500),

            ),
          ],
        ),
      ),
    );
  }
}
