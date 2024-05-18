import 'package:detection/models/booking.dart';
import 'package:detection/modules/doctor%20items/booking/coming.dart';
import 'package:detection/modules/doctor%20items/booking/done.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DeletedBookingsPage extends StatelessWidget {
  final List<booking> deletedUserDataList;

  const DeletedBookingsPage({Key? key, required this.deletedUserDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Deleted Bookings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle item selection
              switch (result) {
                case 'Item 1':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => coming()),
                  );
                  break;
                case 'Item 2':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => done()),
                  );
                  break;
                case 'Item 3':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => done()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Item 1',
                child: Text('Comming'),
              ),
              const PopupMenuItem<String>(
                value: 'Item 2',
                child: Text('Done'),
              ),
              const PopupMenuItem<String>(
                value: 'Item 3',
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
      body: deletedUserDataList.isEmpty
          ? Center(
        child: Text(
          "No deleted bookings available",
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: deletedUserDataList.length,
        itemBuilder: (context, index) {
          final item = deletedUserDataList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: 120,
                child: Row(
                  children: [
                    Image.asset(item.imagePath, width: 100, height: 100),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            item.date,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            item.time,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}