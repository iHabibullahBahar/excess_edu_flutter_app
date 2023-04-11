import 'dart:convert';

import 'package:excess_edu/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../consts/colors.dart';
import '../../models/test/product_model.dart';
import '../widgets/app_bar.dart';

class DownloadsPage extends StatefulWidget {
  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    loadData();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<void> loadData() async {
    String response = await rootBundle.loadString('assets/files/test.json');
    final decodeData = await jsonDecode(response);
    final productsData = decodeData["products"];
    ProductModel.products = productsData
        .map<Product>((item) => Product.fromMap(item))
        .toList()
        .cast<Product>();
    if (_isMounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: MyDrawer(),
      body: Container(
        child: Container(child: Text("Downloads")),
      ),
    );
  }
}
