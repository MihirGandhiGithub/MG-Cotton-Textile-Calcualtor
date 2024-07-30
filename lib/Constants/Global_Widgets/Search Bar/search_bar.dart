import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchbarWithIcon extends StatelessWidget {
  final String searchbarText;
  final ValueChanged onChange;
  final TextEditingController controller;
  final VoidCallback clearButtonPressed;

  const SearchbarWithIcon(
      {super.key,
      required this.searchbarText,
      required this.onChange,
      required this.controller,
      required this.clearButtonPressed});

  @override
  Widget build(BuildContext context) {
    // FocusNode myFocusNode;
    // myFocusNode = FocusNode();

    return CupertinoSearchTextField(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          )
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      onSuffixTap: clearButtonPressed,
      controller: controller,
      placeholder: searchbarText,
      onChanged: onChange,
    );

    // return Container(
    //     alignment: Alignment.center,
    //     height: 160.h,
    //     margin: EdgeInsets.only(
    //         top: 20.sp, bottom: 20.sp, left: 30.sp, right: 30.sp),
    //     // padding: EdgeInsets.only(right: 40.sp),
    //     decoration: BoxDecoration(
    //       boxShadow: [
    //         BoxShadow(
    //           offset: const Offset(0, 2),
    //           blurRadius: 5,
    //           color: Colors.black.withOpacity(0.3),
    //         )
    //       ],
    //       color: Colors.white,
    //       borderRadius: const BorderRadius.all(Radius.circular(10)),
    //     ),
    //     child: Row(
    //       children: [
    //         IconButton(
    //           onPressed: () {
    //             // myFocusNode.requestFocus();
    //           },
    //           icon: const Icon(Icons.search),
    //         ),
    //         SizedBox(
    //           width: 950.sp,
    //           child: TextFormField(
    //             // focusNode: myFocusNode,
    //             controller: controller,
    //             onChanged: onChange,
    //             keyboardType: TextInputType.text,
    //             textAlign: TextAlign.start,
    //             style: TextStyle(
    //               fontSize: 60.sp,
    //               color: Colors.black,
    //             ),
    //             decoration: InputDecoration(
    //               hintStyle: const TextStyle(
    //                 color: Colors.black12,
    //               ),
    //               border: InputBorder.none,
    //               hintText: searchbarText,
    //             ),
    //           ),
    //         ),
    //         controller.text.isNotEmpty
    //             ? IconButton(
    //                 onPressed: clearButtonPressed,
    //                 icon: const Icon(Icons.clear),
    //               )
    //             : const SizedBox()
    //       ],
    //     ));
  }
}
