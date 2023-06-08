//
// import 'package:flutter/material.dart';
// import 'package:seniorconnect/Models/Card%20Model.dart';
//
// class mobileCardsWidget extends StatelessWidget {
//   final CardModel card;
//
//   mobileCardsWidget({
//     required this.card,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//         padding: const EdgeInsets.only(
//           top: 20, left: 20, right: 20, ),
//         child:  Card(
//           elevation: 8,
//           color: Theme.of(context).cardColor,
//           shape: RoundedRectangleBorder(
//               borderRadius:
//               BorderRadius.circular(100)),
//           child: ListTile(
//             onTap: () {
//
//                 Navigator.pushNamed(
//                   context,
//                   card.screenPath,
//                 );
//
//             },
//
//             contentPadding:
//             const EdgeInsets.symmetric(
//                 horizontal: 015, vertical: 5),
//             leading: Container(
//               width: 40,
//               height: 40,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10, horizontal: 10),
//                 child:
//               ),
//             ),
//             trailing: const Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 color: Colors.white,
//                 size: 15),
//             title: Text(
//                 card.title,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold)),
//             subtitle:
//             FutureBuilder<dynamic>(
//               future: card.subtitle,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   final double screenWidth = MediaQuery.of(context).size.width;
//                   final double Size = screenWidth > 500 ? 22 : 15;
//                   final TextStyle textStyle = TextStyle(
//                     color: Colors.white,
//                     fontSize: Size,
//                   );
//
//                   return   Text(
//                       snapshot.data as String,
//                       style: textStyle);
//                 }
//               },
//             ),
//           ),
//         ));
//   }
// }
