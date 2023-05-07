import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({Key? key}) : super(key: key);

  @override
  State<listView> createState() => listViewState();
}

class listViewState extends State<listView> {
  @override
  Widget build(BuildContext context) {
    var arr = [
      'Aspirin',
      'Metformin',
      'Lisinopril',
      'Atorvastatin',
      'Warfarin',
      'JOmeprazole',
    ];
    var des = [
      'Used for pain relief, reducing inflammation, and as a blood thinner to prevent heart attacks and strokes.',
      'Prescribed for managing type 2 diabetes by controlling blood sugar levels.',
      'An ACE inhibitor that helps lower blood pressure and treat heart conditions such as hypertension and congestive heart failure.',
      'A statin medication used to lower cholesterol levels and reduce the risk of heart disease.',
      'An anticoagulant (blood thinner) prescribed to prevent blood clots and reduce the risk of stroke and embolism.',
      'A proton pump inhibitor (PPI) used to reduce stomach acid production and treat conditions like acid reflux, ulcers, and gastritis.',
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
                  child: Icon(
                    Icons.medical_information_outlined,
                  ),
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
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.check_circle_outline_rounded),
                        onPressed: () {
                          //not work
                        },
                      ),
                      margin: EdgeInsets.only(top: 8),
                    )
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
    );
  }
}
