import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserPaymentView extends StatefulWidget {
  const UserPaymentView({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  State<UserPaymentView> createState() => _UserPaymentViewState();
}

class _UserPaymentViewState extends State<UserPaymentView> {
  late final WebViewController _controller;

  final UserPaymentController userPaymentController =
  Get.put(UserPaymentController());

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

                await userPaymentController.getPaymentDetailsController(
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
        Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [


            AuthAppBarHelperWidget(
              onBackPressed: () async {
                Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
              },
              title: "Order Payment",
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