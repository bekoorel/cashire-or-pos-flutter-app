import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:possingle/pos.dart';

import 'package:printing/printing.dart';

class printpos extends StatefulWidget {
  printpos({Key? key}) : super(key: key);

  @override
  State<printpos> createState() => _printposState();
}

class _printposState extends State<printpos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PdfPreview(
          build: (format) => _generatePdf(
            format,
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
    PdfPageFormat format,
  ) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    Uint8List fontData =
        File('assets/fonts/Cairo-Regular.ttf').readAsBytesSync();
    var data = fontData.buffer.asByteData();

    var myFont = pw.Font.ttf(data);
    var myStyle = pw.TextStyle(
        font: myFont, fontWeight: pw.FontWeight.bold, fontSize: 10);

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.roll80,
          build: (context) {
            return pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Column(children: [
                    pw.Row(children: [
                      pw.Text('العنوان',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.SizedBox(
                        width: 20.0,
                      ),
                      pw.Text('رقم الهاتف',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.SizedBox(
                        width: 20.0,
                      ),
                      pw.Text('اسم المطعم',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                    ]),
                    pw.Container(
                      width: 200.0,
                      child: pw.Divider(),
                    ),
                    pw.Row(children: [
                      pw.Text('عنوان العميل',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.SizedBox(
                        width: 20.0,
                      ),
                      pw.Text('رقم الهاتف',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.SizedBox(
                        width: 20.0,
                      ),
                      pw.Text('اسم العميل',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                    ]),
                    pw.Row(
                      children: [
                        pw.Container(
                          width: 200.0,
                          child: pw.Divider(),
                        )
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text('الاجمالي',
                            style: myStyle,
                            textDirection: pw.TextDirection.rtl),
                        pw.SizedBox(
                          width: 20.0,
                        ),
                        pw.Text('الكميه',
                            style: myStyle,
                            textDirection: pw.TextDirection.rtl),
                        pw.SizedBox(
                          width: 20.0,
                        ),
                        pw.Text('السعر',
                            style: myStyle,
                            textDirection: pw.TextDirection.rtl),
                        pw.SizedBox(
                          width: 20.0,
                        ),
                        pw.Text('الصنف',
                            style: myStyle,
                            textDirection: pw.TextDirection.rtl),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Container(
                          width: 200.0,
                          child: pw.Divider(),
                        ),
                      ],
                    ),
                    pw.ListView.builder(
                        itemCount: lprint.length,
                        itemBuilder: ((context, index) {
                          return pw.Container(
                              margin: pw.EdgeInsets.all(2),
                              height: 20.0,
                              width: 200.0,
                              decoration: pw.BoxDecoration(
                                borderRadius: pw.BorderRadius.zero,
                                color: PdfColor.fromRYB(0.0, 0.0, 0.200),
                              ),
                              child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceEvenly,
                                  children: [
                                    pw.Text('${lprint[index]['totalcash']}',
                                        style: myStyle,
                                        textDirection: pw.TextDirection.rtl),
                                    pw.Text('${lprint[index]['count']}',
                                        style: myStyle,
                                        textDirection: pw.TextDirection.rtl),
                                    pw.Text('${lprint[index]['amount']}',
                                        style: myStyle,
                                        textDirection: pw.TextDirection.rtl),
                                    pw.Text('${lprint[index]['name']}',
                                        style: myStyle,
                                        textDirection: pw.TextDirection.rtl),
                                  ]));
                        })),
                    pw.Container(
                      width: 200.0,
                      child: pw.Divider(),
                    ),
                    /* pw.Row(children: [
                      pw.Text('CASH=',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.Text('${total.toString()}',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.SizedBox(width: 20.0),
                      pw.Text('DELVERY=',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                      pw.Text('${delvery.toString()}',
                          style: myStyle, textDirection: pw.TextDirection.rtl),
                    ]),*/
                    pw.Text('TOTAL',
                        style: myStyle, textDirection: pw.TextDirection.rtl),
                    pw.Text('${total.toString()}',
                        style: myStyle, textDirection: pw.TextDirection.rtl),
                  ]),
                ]);
          }),
    );

    return pdf.save();
  }
}
