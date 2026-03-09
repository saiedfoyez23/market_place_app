import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorPaymentView extends StatefulWidget {
  const VendorPaymentView({super.key,required this.paymentUrl});
  final String paymentUrl;
  @override
  State<VendorPaymentView> createState() => _VendorPaymentViewState();
}

class _VendorPaymentViewState extends State<VendorPaymentView> {
  late final WebViewController _controller;
  final VendorPaymentController vendorPaymentController = Get.put(VendorPaymentController());


  @override
  void initState() {
    super.initState();
    // Initialize WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Show loading indicator if needed
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // Page loaded
            print('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            // Handle errors
            print('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) async {
            print("hello ${request.url}");
            //Handle redirects or specific URLs (e.g., success/failure callbacks)
            await vendorPaymentController.getPaymentDetailsController(context: context,paymentUrl: request.url);
            if (request.url.contains('success') || request.url.contains('failure')) {
              //Handle payment result
              //_handlePaymentResult(request.url);

              return NavigationDecision.prevent; // Prevent navigation in WebView
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl)); // Load the Paymob URL
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
