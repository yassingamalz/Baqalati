import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  late String _barcode;
  late Map<String, dynamic> _productInfo;

  @override
  void initState() {
    super.initState();
    _barcode = '';
    _productInfo = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Barcode: $_barcode',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                scanBarcode();
              },
              icon: SvgPicture.asset(
                'assets/icons/scan.svg',
                width: 24.0,
                height: 24.0,
              ),
              label: Text('Scan Barcode'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Product Info: ${_productInfo.toString()}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    try {
      String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000', // Color for the scan view background
        'Cancel', // Button text for the cancel button
        true, // Show flash icon
        ScanMode.BARCODE, // Specify the scan mode
      );

      setState(() {
        _barcode = barcodeScanResult;
      });

      getProductInfo();
    } catch (e) {
      setState(() {
        _barcode = 'Failed to scan barcode.';
      });
    }
  }

  Future<void> getProductInfo() async {
    try {
      // Replace 'your_api_endpoint' with the actual endpoint to retrieve product information
      String apiUrl = 'http://192.168.1.6:8080/products/$_barcode';

      http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          _productInfo = data;
        });
      } else {
        setState(() {
          _productInfo = {};
        });
      }
    } catch (e) {
      setState(() {
        _productInfo = {};
      });
    }
  }
}
