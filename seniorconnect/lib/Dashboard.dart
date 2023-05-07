import 'package:flutter/material.dart';
import 'package:seniorconnect/MedicineReminder.dart';
import 'package:seniorconnect/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BMI.dart';
import 'DoctorPrescription.dart';
import 'GroupChat.dart';
import 'Login_screen.dart';
import 'Reports.dart';
import 'drawer.dart';

showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.green)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Logout', style: TextStyle(color: Colors.red)),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Logged out successfully.')),
              );
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                          username: '',
                          password: '',
                        )),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      );
    },
  );
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your FRIEND!'),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel_presentation),
            onPressed: () {
              showLogoutDialog(context);
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(''),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  radius: 40,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RamKishor",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Age: 67',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.medical_services),
                    title: Text(
                      'Medicine Reminder',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Manage your medication schedule'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => listView(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.group),
                    title: Text(
                      'Group Chat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Connect with other senior citizens'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupChatPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.description),
                    title: Text(
                      'Doctor Prescription',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('View your doctor prescriptions'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorPrescriptionPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.format_list_bulleted),
                    title: Text(
                      'To-Do List',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Manage your tasks and activities'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoListPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.health_and_safety_outlined),
                    title: Text(
                      'BMI CHECKER',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Track and Analyze Your Body Mass Index (BMI) Progress'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMICalculatorPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text(
                      'Reports',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('View your health reports and data'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Report(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
