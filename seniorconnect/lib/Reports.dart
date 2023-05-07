import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => ReportViewPageState();
}

class ReportViewPageState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    var arr = ['Report 1', 'Report 2', 'Report 3', 'Report 4'];
    var des = [
      'Description for Report 1',
      'Description for Report 2',
      'Description for Report 3',
      'Description for Report 4'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Reminder"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              shadowColor: Colors.grey.withOpacity(0.5),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.file_copy_outlined),
                ),
                title: Text(
                  arr[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  des[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                iconColor: Colors.lightGreen,
                trailing: Column(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.file_download),
                        onPressed: () {},
                      ),
                      margin: EdgeInsets.only(top: 8),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: arr.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
