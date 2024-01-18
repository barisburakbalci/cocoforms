import 'package:cocoforms/models/customer_model.dart';
import 'package:cocoforms/widgets/customer_forms.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatefulWidget {
  const CustomerCard({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  bool isExpanded = false;

  void expandCustomer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: expandCustomer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.customer.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: isExpanded ? 0.25 : 0,
                        child: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: SizedBox(
            height: isExpanded ? null : 0,
            child: CustomerForms(customerId: widget.customer.id),
          ),
        ),
      ],
    );
  }
}
