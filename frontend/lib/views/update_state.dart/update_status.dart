import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_shippings.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';

class UpdateStatus extends StatelessWidget {
  const UpdateStatus({super.key, required this.id, required this.enviosList, required this.filtersActive});
  final int id;
  final List<Shipping?> enviosList;
  final List<int> filtersActive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBack(context),
      body: ListView(
        children: [
          NavigatorShippings(id: id, enviosList: enviosList, filtersActive: filtersActive, addFilter: (value){}, removeFilter: (value){}, btnText: 'Cambiar Estado', btnRegister: false,),
        ],
      ),
    );
  }
}