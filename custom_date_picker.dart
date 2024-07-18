import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/responsive.dart';

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onDateChanged;
  final DateTime initialDate;
  final bool isRequired;

  final double? inputFieldSize;
  final String titleText;

  const CustomDatePicker({
    super.key,
    this.onDateChanged,
    required this.initialDate,
    this.isRequired = false,
    this.inputFieldSize,
    required this.titleText,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateChanged?.call(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                children: [
                  widget.isRequired == true
                      ? const TextSpan(
                          text: '*', style: TextStyle(color: Colors.red))
                      : const TextSpan(),
                  WidgetSpan(
                      child: widget.isRequired == true
                          ? const SizedBox(width: 4)
                          : const SizedBox()), // Add space between TextSpans
        
                  TextSpan(
                    text: widget.titleText,
                  ),
                  // Add more TextSpan as needed
                ],
              ),
            ),
            const Gap(2),
            InkWell(
              onTap: () => _selectDate(context),
              child: SizedBox(
                height: 35,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const Icon(
                        Icons.calendar_month,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
