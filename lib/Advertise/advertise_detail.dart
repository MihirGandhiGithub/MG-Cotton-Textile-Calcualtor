import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Constants/Global_Widgets/Appbar/appbar_with_text.dart';

class AdvertiseDetail extends StatefulWidget {
  final String documentid;
  final String name;
  final String email;
  final String contact;

  const AdvertiseDetail({
    super.key,
    required this.documentid,
    required this.name,
    required this.email,
    required this.contact,
  });

  @override
  State<AdvertiseDetail> createState() => _AdvertiseDetailState();
}

class _AdvertiseDetailState extends State<AdvertiseDetail> {
  Map<String, dynamic>? userData;
  @override
  void initState() {
    super.initState();
    // print(widget.documentid);
    fetchData();
  }

  int? counter;
  String? index;
  bool isdataCompelteFetched = false;
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> updateCounter() async {
    try {
      DocumentReference userRef =
          _firestore.collection('counters').doc('Adverties $index');

      Map<String, dynamic> newData = {
        'name': widget.name,
        'email': widget.email,
        'contact no.': widget.contact,
        'counter no.': counter! + 1,
        'timestamp': DateTime.timestamp(),
        // Add more key-value pairs to the map if needed// Add server timestamp
      };
      await userRef.update({
        'advertiesCounter': counter! + 1,
        'AdvertiseData': FieldValue.arrayUnion([newData])
      });
    } catch (e) {
      // print('Error adding data: $e');
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> fetchData() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('advertise link')
          .doc(widget.documentid)
          .get();

      if (snapshot.exists) {
        setState(() {
          userData = snapshot.data() as Map<String, dynamic>;
          isdataCompelteFetched = true;
          index = userData!['index'];
        }); // Update the UI after data is fetched
        await _firestore
            .collection('counters')
            .doc('Adverties $index')
            .get()
            .then((value) {
          setState(() {
            counter = value.data()!['advertiesCounter'];
          });
        });
        updateCounter();
      } else {
        // print('Document not found');
      }
    } catch (e) {
      // print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithText(
        appbarText: 'Advertiser Detail',
        centerTitle: false,
        isBackButton: false,
      ),
      body: userData != null
          ? ListView(
              physics: const BouncingScrollPhysics(),
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  margin: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, top: 20.sp, bottom: 20.sp),
                  height: 450.sp,
                  child: ImageContainer(
                    imageurl: '${userData!['advertise_link']}',
                  ),
                ),

                DisplayText(
                  keys: 'Business Name',
                  value: '${userData!['businessname']}',
                ),
                DisplayText(
                  keys: 'Name',
                  value: '${userData!['Name']}',
                ),
                DisplayText(
                  keys: 'Contact No. ',
                  value: '${userData!['contact']}',
                ),
                DisplayText(
                  keys: 'Business Detail',
                  value: '${userData!['About us']}',
                ),
                DisplayText(
                  keys: 'Location',
                  value: '${userData!['address']}',
                ),

                SizedBox(
                  height: 50.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 80.w, right: 80.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.sp),
                        )),
                    onPressed: () => _makePhoneCall('${userData!['contact']}'),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 150.sp,
                            child: Icon(
                              Icons.call,
                              size: 100.sp,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 40.w,
                        ),
                        Text(
                          'Contact Now',
                          style:
                              TextStyle(color: Colors.white, fontSize: 50.sp),
                        )
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Want to give your Advertise ? Then Call',
                        style: TextStyle(color: Colors.black, fontSize: 40.sp),
                      ),
                      TextButton(
                          onPressed: () => _makePhoneCall('99135 59449'),
                          child: Text(
                            '+91 99135 59449',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 40.sp),
                          ))
                    ],
                  ),
                )

                // Add other widgets to display more data if needed
              ],
            )
          : const Center(
              child:
                  CircularProgressIndicator(), // Loading indicator while data is being fetched
            ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageurl;

  const ImageContainer({super.key, required this.imageurl});
  @override
  Widget build(BuildContext context) {
    return Container(
      // Full width
      height: 450.sp, // Height of 150
      color: Colors.grey, // Optional background color
      child: Image.network(
        imageurl, // Replace with your image URL
        fit: BoxFit.cover, // Adjust the image fit
      ),
    );
  }
}

class DisplayText extends StatelessWidget {
  final String keys;
  final String value;
  const DisplayText({super.key, required this.keys, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 20.h),
        padding: EdgeInsets.only(left: 20.w, top: 40.h, bottom: 40.h),
        child: Row(
          children: [
            Text(
              '$keys : ',
              style: TextStyle(
                color: Colors.black, // Change the color as needed
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black, // Change the color as needed
                  fontSize: 55.sp,
                ),
              ),
            ),
          ],
        ));
  }
}
