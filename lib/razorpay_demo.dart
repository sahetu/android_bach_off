import 'package:flutter/material.dart';
import 'package:razorpay_web/razorpay_web.dart';

class RazorpayDemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RazorpayDemoHome(),
    );
  }
}

class RazorpayDemoHome extends StatefulWidget {
  @override
  _RazorpayDemoHomeState createState() => _RazorpayDemoHomeState();
}

class _RazorpayDemoHomeState extends State<RazorpayDemoHome> {
  late Razorpay razorpay;

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorHandler);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);
    super.initState();
  }

  TextEditingController amountController = TextEditingController();
  void errorHandler(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message!),
      backgroundColor: Colors.red,
    ));
  }

  void successHandler(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.paymentId!),
      backgroundColor: Colors.green,
    ));
  }

  void externalWalletHandler(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.walletName!),
      backgroundColor: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Razor pay")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(
                hintText: "Amount",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              openCheckout();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: Text("Pay now"),
            ),
          ),
        ],
      )),
    );
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_xsiOz9lYtWKHgF",
      "amount": num.parse(amountController.text) * 100,
      "name": "Flutter Demo",
      "description": " this is the test payment",
      "timeout": "180",
      "currency": "INR",
      "prefill": {
        "contact": "7433050707",
        "email": "sagar@gmail.com",
      }
    };
    razorpay.open(options);
  }
}