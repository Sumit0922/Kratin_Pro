import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => ReportViewPageState();
}

class ReportViewPageState extends State<Report> {
  final scrollControler = ScrollController();
  List posts= [];
  bool loadingit =false;
  int page = 1;
  @override
  void initState() {
    super.initState();
    scrollControler.addListener(_scrollListener);
    FetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Repots Pagination"),
      ),
      body: ListView.builder(
        controller: scrollControler,
        padding: EdgeInsets.all(8.0),
        itemCount: loadingit ? posts.length + 1 :  posts.length,
          itemBuilder: (context, index){
          if (index < posts.length){
            final post = posts[index];
            final title = post['title']['rendered'];
            final subtitle = post['seoDescription'];

            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${index +1}')),
                title: Text('$title'),
                subtitle: Text('$subtitle'),

              ),
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      })
    );
  }



  Future<void> FetchData() async{
     try{
       final  apiUrl = "https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10&page=$page";
       final deadurl = "https://api.admission.wysax.com/applicant/20?schoolId=2";
       final uri = Uri.parse(deadurl);

       final  response = await http.get(uri).timeout(Duration(seconds: 1));


       if (response.statusCode ==200) {
         final json = jsonDecode(response.body)as List;
         setState(() {
           posts = posts + json;
         });


       }

     }
     catch(e){
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text('Error'),
             content: Text('Failed to fetch data. Please try again later.'),
             actions: <Widget>[
               TextButton(
                 onPressed: () => Navigator.of(context).pop(),
                 child: Text('OK'),
               ),
             ],
           );
         },
       );
       print('Error: $e');

     }

  }

 Future< void> _scrollListener() async{
    if(loadingit)return;
    if (scrollControler.position.pixels == scrollControler.position.maxScrollExtent){
      setState(() {
        loadingit = true;
      });
 page = page + 1 ;
await FetchData();
setState(() {
  loadingit = false;
});

    }

  }
}
