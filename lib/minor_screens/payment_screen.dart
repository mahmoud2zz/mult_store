import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mult_store/minor_screens/payment_screen.dart';
import 'package:mult_store/widget/yellow_button.dart';
import 'package:provider/provider.dart';

import '../customer_screens/wilshlist_.dart';
import '../main_screens/profile.dart';
import '../providers/cart_providers.dart';
import '../widget/alert_dialog.dart';
import '../widget/appber_widgets.dart';
import '../widget/categ_widgets.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalPrice = context.watch<Cart>().totalPrice;
    double totalPaid = context.watch<Cart>().totalPrice + 10.0;

    CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');

    return FutureBuilder<DocumentSnapshot>(
        future: customers.doc(FirebaseAuth.instance.currentUser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Material(
              color: Colors.grey.shade200,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.grey.shade200,
                  appBar: AppBar(
                    backgroundColor: Colors.grey.shade200,
                    elevation: 0,
                    leading: AppBeckButton(),
                    automaticallyImplyLeading: false,
                    title: AppBerTitle(
                      title: 'Payment ',
                    ),
                  ),
                  body: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 60),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text('${totalPaid.toStringAsFixed(2)} USD',
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' Total order',
                                      style: TextStyle(fontSize: 16,color: Colors.grey),
                                    ),
                                    Text('${totalPrice.toStringAsFixed(2)} USD ',
                                        style: TextStyle(fontSize: 16,color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Shippin Coast',
                                      style: TextStyle(fontSize: 16,color: Colors.grey),
                                    ),
                                    Text('10.0  '+('USD'),
                                        style: TextStyle(fontSize: 16,color: Colors.grey))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ))
                      ],
                    ),
                  ),
                  bottomSheet: Container(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YellowButton(
                        label:
                            'Confirm ${context.watch<Cart>().totalPrice.toStringAsFixed(2)} USD',
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen())),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
