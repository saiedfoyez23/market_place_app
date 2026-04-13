import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorPaymentView extends StatefulWidget {
  const VendorPaymentView({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  State<VendorPaymentView> createState() => _VendorPaymentViewState();
}

class _VendorPaymentViewState extends State<VendorPaymentView> {
  late final WebViewController _controller;
  final VendorPaymentController vendorPaymentController = Get.put(VendorPaymentController());

  String? _processedPaymentId; // ✅ Track processed payment
  bool _isLoading = true; // ✅ Optional loader

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _isLoading = true);
            debugPrint("Loading: $url");
          },

          onPageFinished: (url) {
            setState(() => _isLoading = false);
            debugPrint("Finished: $url");
          },

          onWebResourceError: (error) {
            debugPrint("Error: ${error.description}");
          },

          onNavigationRequest: (NavigationRequest request) async {
            final uri = Uri.parse(request.url);

            debugPrint("URL HIT: ${request.url}");

            // ✅ Detect confirm payment URL
            if (uri.path.contains('/confirm-payment')) {
              final paymentId = uri.queryParameters['paymentId'];

              // ✅ Prevent duplicate API call
              if (paymentId != null && paymentId != _processedPaymentId) {
                _processedPaymentId = paymentId;

                await vendorPaymentController.getPaymentDetailsController(
                  context: context,
                  paymentUrl: request.url,
                );

                return NavigationDecision.prevent; // ✅ stop reload
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [


            AuthAppBarHelperWidget(
              onBackPressed: () async {
                Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
              },
              title: "Subscription Payment",
            ),


            SliverFillRemaining(
              child: Stack(
                children: [
                  // ✅ Loader
                  if (_isLoading)...[
                    LoadingHelperWidget.loadingHelperWidget(
                      context: context,
                      height: 930.h(context),
                    )
                  ] else...[
                    WebViewWidget(controller: _controller),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

