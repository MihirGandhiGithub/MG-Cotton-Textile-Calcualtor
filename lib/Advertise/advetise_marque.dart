// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kt1_textile_calculator/Advertise/advertise_detail.dart';
//
// class CarouselSliderWidget extends StatefulWidget {
//   final List<String> doumentid;
//   final List<String> imageList;
//   final CarouselController carouselController;
//   final int currentImageIndex;
//   final String name;
//   final String email;
//   final String contact;
//   final Function(int, CarouselPageChangedReason) onPageChangedCallback;
//
//   const CarouselSliderWidget({
//     super.key,
//     required this.imageList,
//     required this.carouselController,
//     required this.currentImageIndex,
//     required this.onPageChangedCallback,
//     required this.doumentid,
//     required this.name,
//     required this.email,
//     required this.contact,
//   });
//
//   @override
//   State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
// }
//
// class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//             height: 400.h,
//             child: widget.imageList.isNotEmpty
//                 ? CarouselSlider.builder(
//                     carouselController: widget.carouselController,
//                     itemCount: widget.imageList.length,
//                     itemBuilder:
//                         (BuildContext context, int index, int realIndex) {
//                       return InkWell(
//                         onTap: () {
//                           widget.carouselController.animateToPage(
//                             index,
//                             duration: const Duration(milliseconds: 2000),
//                             curve: Curves.easeInOut,
//                           );
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AdvertiseDetail(
//                                 documentid: widget.doumentid[index],
//                                 name: widget.name,
//                                 email: widget.email,
//                                 contact: widget.contact,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//
//                           // padding: EdgeInsets.all(5.sp),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: Image.network(
//                               widget.imageList[index],
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     options: CarouselOptions(
//                       scrollPhysics: const BouncingScrollPhysics(),
//                       height: 450.sp,
//                       viewportFraction: 1.0,
//                       autoPlay: true,
//                       onPageChanged: (index, reason) {
//                         widget.onPageChangedCallback(
//                             index, reason); // Call the callback function here
//                       },
//                     ),
//                   )
//                 : const Center(
//                     child: CircularProgressIndicator(
//                     color: Colors.grey,
//                   ))),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: widget.imageList.asMap().entries.map((entry) {
//             int index = entry.key;
//             return GestureDetector(
//               onTap: () {
//                 widget.carouselController.animateToPage(
//                   index,
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.easeInOut,
//                 );
//               },
//               child: Container(
//                 width: 30.sp,
//                 height: 30.sp,
//                 margin: EdgeInsets.only(
//                     top: 30.sp, bottom: 30.sp, left: 10.sp, right: 10.sp),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: widget.currentImageIndex == index
//                       ? Colors.blue
//                       : Colors.grey,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
