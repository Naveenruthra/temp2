import 'package:collections_web/widgets/responsive.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';
import 'alert_dialog_widget.dart';
import 'custom_title_widget.dart';

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});
  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  late DropzoneViewController filesController;
  String? fileName;
  bool isHighlighted = false;
  bool isUploading = false;
  double uploadProgress = 0.0;
  bool isUploadCompleted = false;

  void startUpload(String fileName) {
    setState(() {
      this.fileName = fileName;
      isUploading = true;
      uploadProgress = 100.0;
    });
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          isUploadCompleted: isUploadCompleted,
          fileName: fileName ?? "",
          progress: uploadProgress,
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void handleFilePick(FilePickerResult? result) {
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.first.name;
      });
      startUpload(result.files.first.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleWidget(
          text: "PAN image",
          color: Colors.black54,
        ),
        Stack(
          children: [
            SizedBox(
              height: 50,
              child: DropzoneView(
                onCreated: (controller) {
                  
                  filesController = controller;
                },
                onDrop: (event) {
                  
                  setState(() {
                    filesController.pickFiles();
                    fileName = event.name;
                  });
                  startUpload(event.name);
                },
                onHover: () {
                  setState(() {
                    isHighlighted = true;
                  });
                },
                onLeave: () {
                  setState(() {
                    isHighlighted = false;
                  });
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                FilePicker.platform.pickFiles().then(handleFilePick);
              },
              child: DottedBorder(
                strokeWidth: 1,
                color: isHighlighted ? Colors.blue : Colors.black54,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.upload,
                              color: AppColors.appPink,
                            ),
                            CustomTitleWidget(
                              text: "Upload Files",
                              color: AppColors.appPink,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveSize().isWide(context)
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or drop files",
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (fileName != null)
          Row(
            children: [
              Text(fileName!),
              IconButton(
                onPressed: () {
                  setState(() {
                    fileName = null;
                    isHighlighted = false;
                  });
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
      ],
    );
  }
}
