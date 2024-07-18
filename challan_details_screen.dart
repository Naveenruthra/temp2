import 'package:collections_web/common_widgets/custom_date_picker.dart';
import 'package:collections_web/modules/challan/screens/challan_details_web_layout.dart';
import 'package:collections_web/modules/challan/widgets/challan_denomination%20_widget.dart';
import 'package:collections_web/test/widget_test/responsive_test.dart';
import 'package:collections_web/widgets/custom_fileupload_widget.dart';
import 'package:collections_web/widgets/custom_title_with_input.dart';
import 'package:flutter/material.dart';

class ChallanDetailsPage extends StatefulWidget {
  const ChallanDetailsPage({super.key});

  @override
  State<ChallanDetailsPage> createState() => _ChallanDetailsPageState();
}

class _ChallanDetailsPageState extends State<ChallanDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Flex(
                direction: ResponsiveSize().isWide(context)
                    ? Axis.horizontal
                    : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTitleWithInput(
                              titleText: "Challan Number",
                            ),
                            CustomDatePicker(
                              titleText: "Physical Challan Date",
                              initialDate: DateTime.now(),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CustomTitleWithInput(
                              titleText: "Physical Challan Number",
                            ),
                            CustomTitleWithInput(
                              titleText: "Chola's A/C Number",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: CustomTitleWithInput(
                                titleText: "Physical Challan Number",
                              ),
                            ),
                            Expanded(child: FileUploadWidget()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20.0),
                  //   child: Container(
                  //       width: ResponsiveSize().isWide(context)
                  //           ? size.width * 0.25
                  //           : size.width,
                  //       child: ChallanDenominationWidget()),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
