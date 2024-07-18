import 'package:collections_web/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChallanDenominationWidget extends StatefulWidget {
  const ChallanDenominationWidget({super.key});

  @override
  State<ChallanDenominationWidget> createState() =>
      _ChallanDenominationWidgetState();
}

class _ChallanDenominationWidgetState extends State<ChallanDenominationWidget> {
  final fiveHundController = TextEditingController();
  final twoHundController = TextEditingController();
  final oneHundController = TextEditingController();
  final fiftyController = TextEditingController();
  final twentyController = TextEditingController();
  final tenController = TextEditingController();
  final fiveController = TextEditingController();
  final twoController = TextEditingController();
  final oneController = TextEditingController();
  final fiveHundAmtController = TextEditingController();
  final twoHundAmtController = TextEditingController();
  final oneHundAmtController = TextEditingController();
  final fiftyAmtController = TextEditingController();
  final twentyAmtController = TextEditingController();
  final tenAmtController = TextEditingController();
  final fiveAmtController = TextEditingController();
  final twoAmtController = TextEditingController();
  final oneAmtController = TextEditingController();
  final totalAmtController = TextEditingController(text: '0');

  List denominations = [];
  @override
  void initState() {
    super.initState();
    denominations = [
      {
        "cur": 500,
        "notes": fiveHundController,
        "amount": fiveHundAmtController,
      },
      {
        "cur": 200,
        "notes": twoHundController,
        "amount": twoHundAmtController,
      },
      {
        "cur": 100,
        "notes": oneHundController,
        "amount": oneHundAmtController,
      },
      {
        "cur": 50,
        "notes": fiftyController,
        "amount": fiftyAmtController,
      },
      {
        "cur": 20,
        "notes": twentyController,
        "amount": twentyAmtController,
      },
      {
        "cur": 10,
        "notes": tenController,
        "amount": tenAmtController,
      },
      {
        "cur": 5,
        "notes": fiveController,
        "amount": fiveAmtController,
      },
      {
        "cur": 2,
        "notes": twoController,
        "amount": twoAmtController,
      },
      {
        "cur": 1,
        "notes": oneController,
        "amount": oneAmtController,
      },
      'Total Amount',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 0,
      color: Colors.grey[200],
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: denominations.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0)
                            const SizedBox(
                              height: 35,
                              child: Text(
                                'Denominations',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ksecondaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          denominations[index] is String
                              ? Text(
                                  denominations[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '${denominations[index]['cur']}   X',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    if (denominations[index] is Map) const SizedBox(width: 20),
                    Expanded(
                      flex: denominations[index] is Map ? 1 : 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: denominations[index] is Map ? 0 : 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 0)
                              const SizedBox(
                                height: 35,
                                child: Text(
                                  'No. of Notes',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ksecondaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            SizedBox(
                              child: denominations[index] is String
                                  ? denominations[index] == "Excess"
                                      ? const Center(child: Text('1122'))
                                      : TextFormField(
                                          enabled: false,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          controller: totalAmtController,
                                        )
                                  : Container(
                                      width: 80,
                                      height: 30,
                                      child: TextFormField(
                                        controller: denominations[index]
                                            ['notes'],
                                        onChanged: (value) => setState(() {
                                          if (value.isEmpty) {
                                            denominations[index]['amount']
                                                .clear();
                                            var denomination = denominations
                                                .whereType<Map>()
                                                .toList();
                                            int total = 0;
                                            for (Map den in denomination) {
                                              total = total +
                                                  int.parse(
                                                      den['amount'].text.isEmpty
                                                          ? "0"
                                                          : den['amount'].text);
                                            }

                                            totalAmtController.text =
                                                total.toString();
                                          } else if (denominations[index]
                                              is Map) {
                                            denominations[index]['amount']
                                                .text = (denominations[index]
                                                        ['cur'] *
                                                    int.parse(
                                                        denominations[index]
                                                                ['notes']
                                                            .text))
                                                .toString();
                                            var denomination = denominations
                                                .whereType<Map>()
                                                .toList();
                                            int total = 0;
                                            for (Map den in denomination) {
                                              total = total +
                                                  int.parse(
                                                      den['amount'].text.isEmpty
                                                          ? "0"
                                                          : den['amount'].text);
                                            }

                                            totalAmtController.text =
                                                total.toString();
                                          }
                                        }),
                                        style: const TextStyle(fontSize: 14),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: '0',
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: denominations[index] is Map ? 20 : 4),
                    if (denominations[index] is Map)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 0)
                              const SizedBox(
                                height: 35,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Amount',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ksecondaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('=   '),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    child: TextFormField(
                                      enabled: false,
                                      controller: denominations[index]
                                          ['amount'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '0',
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
