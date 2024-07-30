import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({
    super.key,
  });

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  bool process = false;
  int? counter;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateCounter() async {
    try {
      DocumentReference userRef =
          _firestore.collection('counters').doc('Web View Counter');

      // Map<String, dynamic> newData = {
      //   'name': widget.name,
      //   'email': widget.email,
      //   'contact no.': widget.contact,
      //   'counter no.': counter! + 1,
      //   'timestamp': DateTime.timestamp(),
      //   // Add more key-value pairs to the map if needed// Add server timestamp
      // };
      // await userRef.update({
      //   'WebViewCounter': counter! + 1,
      //   'WebviewData': FieldValue.arrayUnion([newData])
      // });

      setState(() {
        _loading = false;
      });
    } catch (e) {
      // print('Error adding data: $e');
    }
  }

  bool _loading = true;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Progress event is not used to update the loading state.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            await _firestore
                .collection('counters')
                .doc('Web View Counter')
                .get()
                .then((value) {
              setState(() {
                counter = value.data()!['WebViewCounter'];
              });
            });
            updateCounter();
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource error here if needed.
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://kingtechnology.in/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 70.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : WebViewWidget(controller: _controller),
          ),
        ],
      ),
    );
  }
}
