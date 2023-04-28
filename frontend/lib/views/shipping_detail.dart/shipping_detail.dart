import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/views/register/widgets/header_back.dart';

import '../shippings_driver/shippings_driver.dart';

class ShippingDetail extends StatelessWidget {
  const ShippingDetail({super.key, required this.envio});
  final Shipping envio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {Navigator.popAndPushNamed(context, "/home-supervisor");},
          padding: const EdgeInsets.only(left:10),
        ),
      ),
      // body: ,
    );
  }
}