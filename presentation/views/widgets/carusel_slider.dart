// import '/config/system_info/my_size.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class MyCarusel extends StatelessWidget {
//   const MyCarusel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         autoPlay: true,
//         height: MySize.width * 0.5,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlayInterval: const Duration(seconds: 3),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         enlargeFactor: 0.3,
//         //onPageChanged: callbackFunction,
//         scrollDirection: Axis.horizontal,
//       ),
//       items: [1, 2, 3, 4, 5].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 // margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: const BoxDecoration(color: Colors.amber),
//                 child: Text(
//                   'text $i',
//                   style: const TextStyle(fontSize: 16.0),
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }
