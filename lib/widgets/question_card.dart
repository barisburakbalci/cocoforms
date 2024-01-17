import 'package:cocoforms/models/option_model.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.expression,
    required this.options,
  });

  final String expression;
  final List<OptionModel> options;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int checkedId = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.expression,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.options.map((option) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(option.value),
                  value: option.id == checkedId,
                  selected: option.id == checkedId,
                  onChanged: (value) {
                    setState(() {
                      checkedId = option.id;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
