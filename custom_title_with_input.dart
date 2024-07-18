import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTitleWithInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool isRequired;
  final bool readOnly;
  final double? inputFieldSize;
  final int? maxLine;
  final String titleText;

  final void Function(String)? onChanged;
  const CustomTitleWithInput(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.obscureText = false,
      this.isRequired = false,
      this.readOnly = false,
      this.inputFieldSize,
      this.maxLine,
      this.onChanged,
      required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                children: [
                  isRequired == true
                      ? TextSpan(
                          text: '*',
                          style: TextStyle(
                              color: isRequired ? Colors.red : Colors.transparent))
                      : const TextSpan(),
                  WidgetSpan(
                    child: isRequired == true
                        ? const SizedBox(width: 4)
                        : const SizedBox(), // Add space between TextSpans
                  ),
                  TextSpan(
                    text: titleText,
                  ),
                  // Add more TextSpan as needed
                ],
              ),
            ),
            const Gap(2),
            Container(
              color: readOnly ? Colors.grey.shade300 : Colors.white,
              child: TextFormField(
                readOnly: readOnly,
                controller: controller,
                obscureText: obscureText,
                maxLines: maxLine ?? 1,
                decoration: InputDecoration(
                  labelText: labelText,
                  isDense: true,
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  border: const OutlineInputBorder(),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
