import 'package:flutter/material.dart';
import 'package:pdf_maker/drawer_menu.dart';
import 'package:pdf_maker/mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'mobile.dart' if (dart.library.html) 'web.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final TextEditingController semesterTEController = TextEditingController();
  final TextEditingController idTEController = TextEditingController();
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController batchTEController = TextEditingController();
  final TextEditingController sectionTEController = TextEditingController();
  final TextEditingController courseCodeTEController = TextEditingController();
  final TextEditingController courseNameTEController = TextEditingController();
  final TextEditingController teacherNameTEController = TextEditingController();
  final TextEditingController teacherDepartmentTEController =
      TextEditingController();
  final TextEditingController teacherDesignationTEController =
      TextEditingController();
  final TextEditingController dateTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static String selectedOption = 'Select Cover Page';
  static String? marksImg;

  bool isGeneratingPDF = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 158, 167),
      drawerScrimColor: const Color.fromARGB(97, 0, 0, 0),
      appBar: appBar(),
      drawer: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.75,
          child: const DrawerMenu(),
        ),
      ),
      body: textFildForm(),
    );
  }

  FutureBuilder<List<int>> textFildForm() {
    return FutureBuilder<List<int>>(
        future: isGeneratingPDF ? _createPDF() : null,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 225, 225, 225),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 45,
                          ),
                          DropdownButton<String>(
                            value: selectedOption,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption = newValue!;
                              });
                            },
                            items: <String>[
                              'Select Cover Page',
                              'Normal Course Assignment Report',
                              'Lab/Project Assignment Report',
                              'Lab/Project Report',
                              'Lab Project Final Report',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          selectedOption == 'Select Cover Page'
                              ? const Text(
                                  'Selected Option: Dafault Normal Course Assignment')
                              : Text('Selected Option: $selectedOption'),
                          const SizedBox(
                            height: 16,
                          ),
                          textFormField('Semester2'),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: idTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Student ID'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Your Student ID';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: nameTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Student Name'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Your Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: batchTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Batch'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Your Batch';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: sectionTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Section'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Your Section';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: courseCodeTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Course Code'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Your Course Code';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: courseNameTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Course Name'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Your Course Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: teacherNameTEController,
                            keyboardType: TextInputType.text,
                            decoration:
                                textFieldDecoration('Course Teacher Name'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Course Teacher Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: teacherDesignationTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration(
                                'Course Teacher Designation'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Course Teacher Designation';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: teacherDepartmentTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration(
                                'Course Teacher Department'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Course Teacher Department';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: dateTEController,
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration('Submission Date'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Submission Date';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(140, 76, 119, 121),
                                ),
                                foregroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              onPressed: isGeneratingPDF ? null : _createPDF,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isGeneratingPDF
                                      ? const CircularProgressIndicator(
                                          color: Colors.green,
                                          backgroundColor: Colors.black,
                                        )
                                      : const Icon(Icons.generating_tokens),
                                  const Text(
                                    'Generate Cover Page',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  TextFormField textFormField(String name) {
    return TextFormField(
      controller: semesterTEController,
      keyboardType: TextInputType.text,
      decoration: textFieldDecoration(name),
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Enter Your $name';
        } else {
          return null;
        }
      },
    );
  }

  InputDecoration textFieldDecoration(String hintAndlabel) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
      hintText: hintAndlabel,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 29, 27)),
      labelText: hintAndlabel,
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 10,
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      toolbarHeight: 100,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: false,
      centerTitle: true,
      flexibleSpace: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cpg_logo.png'),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }

  Future<List<int>> _createPDF() async {
    setState(() {
      isGeneratingPDF = true;
    });
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawImage(
      PdfBitmap(await _readImageData('image.png')),
      const Rect.fromLTWH(110, 15, 300, 100),
    );

    // 'Normal Course Assignment Report',
    //                     'Lab/Project Assignment Report',
    //                     'Lab/Project Report',
    //                     'Lab Project Final Report',

    if (selectedOption == 'Lab/Project Assignment Report') {
      marksImg = 'marks_distribution/lab_project_assignment.png';
    } else if (selectedOption == 'Lab/Project Report') {
      marksImg = 'marks_distribution/lab_project_report.png';
    } else if (selectedOption == 'Lab Project Final Report') {
      marksImg = 'marks_distribution/lab_project_final.png';
    } else {
      marksImg = 'marks_distribution/assignment_report.png';
    }

    page.graphics.drawImage(
      PdfBitmap(await _readImageData(marksImg!)),
      const Rect.fromLTWH(15, 130, 490, 325),
    );

    page.graphics.drawString('Semester : ${semesterTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 470, 500, 300));
    page.graphics.drawString('Name : ${nameTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 495, 500, 300));
    page.graphics.drawString('Student ID : ${idTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 520, 500, 300));
    page.graphics.drawString(
        'Batch : ${batchTEController.text}\t\t\tSection: ${sectionTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 545, 500, 300));
    page.graphics.drawString('Course Code : ${courseCodeTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 570, 500, 300));
    page.graphics.drawString('Course Name: ${courseNameTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 595, 500, 300));
    page.graphics.drawString(
        'Course Teacher Name : ${teacherNameTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 630, 500, 300));
    page.graphics.drawString(
        'Designation: ${teacherDesignationTEController.text}, Department Of ${teacherDepartmentTEController.text},',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 655, 500, 300));
    page.graphics.drawString('  Daffodil International University.',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(100, 680, 500, 300));
    page.graphics.drawString('Submition Date: ${dateTEController.text}',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(25, 725, 500, 300));

    // PdfGrid grid = PdfGrid();
    // grid.style = PdfGridStyle(
    //   font: PdfStandardFont(PdfFontFamily.helvetica, 30),
    //   cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
    // );

    // grid.columns.add(count: 3);
    // grid.headers.add(1);

    // PdfGridRow header = grid.headers[0];
    // header.cells[0].value = 'Roll No';
    // header.cells[1].value = 'Name';
    // header.cells[2].value = 'Class';

    // PdfGridRow row = grid.rows.add();
    // row.cells[0].value = '3';
    // row.cells[1].value = 'Shamim';
    // row.cells[2].value = '8';
    // PdfGridRow row1 = grid.rows.add();
    // row1.cells[0].value = '4';
    // row1.cells[1].value = 'Shamim4';
    // row1.cells[2].value = '85';

    // grid.draw(page: document.pages.add(),bounds: const Rect.fromLTWH(0,0,0,0));
    // grid.draw(page: page, bounds: const Rect.fromLTWH(10, 150, 500, 300));

    List<int> bytes = document.saveSync();
    document.dispose();

    // saveAndLaunchFile(bytes, 'Output.pdf');

    setState(() {
      isGeneratingPDF = false;
    });

    return bytes;
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
