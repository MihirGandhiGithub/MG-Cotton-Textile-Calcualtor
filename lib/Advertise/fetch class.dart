// class customImageSlider{
//   //For Image Slider (Advertise Slider)
//   static int currentImageIndex = 0;
//   static final List<String> imageList = [];
//   static final List<String> documentid = [];
//
//
//   Future<void> _loadImageUrlsFromFirestore() async {
//     try {
//       final QuerySnapshot snapshot =
//       await FirebaseFirestore.instance.collection('advertise link').get();
//
//       // Use a Map to temporarily store the data
//       final Map<int, String> tempImageMap = {};
//       final Map<int, String> tempDocumentIdMap = {};
//
//       for (final doc in snapshot.docs) {
//         final uid = doc.id;
//         final index = doc['index'];
//         final link = doc['advertise_link'];
//         final int? indexInt = int.tryParse(index);
//
//         if (indexInt != null && indexInt >= 0) {
//           setState(() {
//             tempImageMap[indexInt] = link;
//             tempDocumentIdMap[indexInt] = uid;
//           });
//         }
//       }
//
//       // Clear the existing lists and add the data from the maps
//       // imageList.clear();
//       // documentid.clear();
//       customImageSlider.imageList.addAll(List.generate(
//           tempImageMap.length, (index) => tempImageMap[index] ?? ''));
//       customImageSlider.documentid.addAll(List.generate(
//           tempDocumentIdMap.length, (index) => tempDocumentIdMap[index] ?? ''));
//     } catch (e) {
//       // Handle any errors that may occur during the fetch process
//       // print('Error fetching image URLs: $e');
//     }
//   }
// }
