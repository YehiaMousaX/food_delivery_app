import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void userTappedOnCard() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Confirm the payment"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card Number: $cardNumber"),
                      Text("Expiry Date: $expiryDate"),
                      Text("Card Holder: $cardHolderName"),
                      Text("CVV: $cvvCode"),
                    ],
                  ),
                ),
                actions: [
                  //yes
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DeliveryProgressPage()));
                      },
                      child: const Text("Yes")),
                  //cancel
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //credit card
            CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: showBackView,
                onCreditCardWidgetChange: (p0) {}),
            //credit card form
            CreditCardForm(
              formKey: formKey,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) => setState(
                () {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                  showBackView = data.isCvvFocused;
                },
              ),
            ),

            //pay button
            MyButton(
                text: "pay now",
                onPressed: () {
                  userTappedOnCard();
                }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
