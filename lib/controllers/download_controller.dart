import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:terza_spiaggia_web/controllers/controllers_esports.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

class DownloadController extends GetxController {
  static DownloadController instance = Get.find();

  RxString filePath = ''.obs;
  final pdf = pw.Document();

  final RxList<ProductModel> products =
      productController.products;
  RxString? pdfFilePath = ''.obs;

  Rx<DateTime> get _timestamp => DateTime.now().obs;

  String get timeHumanReadable =>
      '${_timestamp.value.day}/${_timestamp.value.month}/${_timestamp.value.year}';

  // Uint8List? imageData;

  // Function to fetch image from network URL and return as Uint8List
  Future<Uint8List> fetchImageFromNetwork(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image: ${response.statusCode}');
    }
  }

  Future<void> generatePdfAndDownload() async {
    var fontSelected = await rootBundle
        .load('assets/fonts/BodoniModa-VariableFont_opsz,wght.ttf');
    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'Terza Spiaggia',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          fontFallback: [
                            pw.Font.ttf(
                              fontSelected,
                            ),
                          ],
                        ),
                      ),
                      pw.Text(
                        'MENU SUSHI',
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                          fontFallback: [
                            pw.Font.ttf(
                              fontSelected,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'Golfo Aranci',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          fontFallback: [
                            pw.Font.ttf(
                              fontSelected,
                            ),
                          ],
                        ),
                      ),
                      pw.Text(
                        'Via degli Asfodeli, snc, \n07020 Golfo Aranci (SS)',
                        style: pw.TextStyle(
                          fontFallback: [
                            pw.Font.ttf(
                              fontSelected,
                            ),
                          ],
                        ),
                      ),
                      pw.Text(
                        '+39 351 532 6140',
                        style: pw.TextStyle(
                          fontFallback: [
                            pw.Font.ttf(fontSelected),
                          ],
                        ),
                      ),
                      pw.Text(
                        'info@terzaspiaggia.com',
                        style: pw.TextStyle(
                          fontFallback: [
                            pw.Font.ttf(
                              fontSelected,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
            pw.ListView.separated(
              separatorBuilder: (context, index) => pw.SizedBox(
                height: 10,
                child: pw.Divider(),
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return pw.Row(
                  children: [
                    pw.Text(
                      product.number,
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        fontFallback: [
                          pw.Font.ttf(
                            fontSelected,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          product.title,
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            fontFallback: [
                              pw.Font.ttf(
                                fontSelected,
                              ),
                            ],
                          ),
                        ),
                        pw.Text(
                          product.description,
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontFallback: [
                              pw.Font.ttf(
                                fontSelected,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.Spacer(),
                    pw.Text(
                      '€ ${product.price.toStringAsFixed(2)}',
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        fontFallback: [
                          pw.Font.ttf(
                            fontSelected,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
                //     return pw.Container(
                //       height: 120,
                //       width: double.infinity,
                //       margin:
                //           const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       padding: const pw.EdgeInsets.all(10),
                //       decoration: pw.BoxDecoration(
                //         color: PdfColor.fromHex('#3f51b5'),
                //         borderRadius: pw.BorderRadius.circular(10),
                //       ),
                //       child: pw.Stack(
                //         children: [
                //           pw.Positioned(
                //             top: 0,
                //             left: 0,
                //             bottom: 0,
                //             child: pw.Container(
                //               width: 110,
                //               height: 200 * 0.2,
                //               decoration: pw.BoxDecoration(
                //                 borderRadius: pw.BorderRadius.circular(10),
                //               ),
                //               child: pw.Builder(
                //                 builder: (context) {
                //                   return pw.Image(
                //                     pw.MemoryImage(imageData),
                //                     fit: pw.BoxFit.cover,
                //                   );
                //                 },
                //               ),
                //             ),
                //           ),
                //           pw.Positioned(
                //             top: 50,
                //             left: 120,
                //             right: 10,
                //             child: pw.Wrap(
                //               alignment: pw.WrapAlignment.spaceBetween,
                //               children: [
                //                 pw.Wrap(
                //                   children: [
                //                     pw.Text(
                //                       product.number,
                //                       style: pw.TextStyle(
                //                         color: PdfColors.white,
                //                         fontSize: 22,
                //                         fontWeight: pw.FontWeight.bold,
                //                       ),
                //                     ),
                //                     pw.SizedBox(width: 15),
                //                     pw.Text(
                //                       product.title,
                //                       style: pw.TextStyle(
                //                         color: PdfColors.white,
                //                         fontSize: 20,
                //                         fontWeight: pw.FontWeight.bold,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 pw.Text(
                //                   '€ ${product.price.toStringAsFixed(2)}',
                //                   style: pw.TextStyle(
                //                     color: PdfColors.white,
                //                     fontSize: 16,
                //                     fontWeight: pw.FontWeight.bold,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           pw.Positioned(
                //             top: 80,
                //             left: 122,
                //             bottom: 10,
                //             child: pw.Text(
                //               product.description,
                //               maxLines: 3,
                //               overflow: pw.TextOverflow.clip,
                //               style: const pw.TextStyle(
                //                 color: PdfColors.white,
                //                 fontSize: 14,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                // for (var product in products)
                //   pw.Row(
                //     children: [
                //       pw.Text(product.number),
                //       pw.SizedBox(width: 10),
                //       pw.Text(product.title),
                //       pw.Spacer(),
                //       pw.Text(
                //         product.price.toStringAsFixed(2),
                //       ),
                //     ],
                //   )
              },
            )
          ];
        },
      ),
    );

    pdf.save().then((value) {
      final blob = html.Blob([value], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('style', 'display: none;')
        ..setAttribute('download', 'terza_spiaggia$timeHumanReadable.pdf');
      html.document.body!.children.add(anchor);
      anchor.click();
      html.document.body!.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    });
  }

  @override
  void onInit() {
    super.onInit();
    generatePdfAndDownload();
  }
}
