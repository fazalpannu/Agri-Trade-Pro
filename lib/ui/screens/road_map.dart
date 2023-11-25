import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Road_map extends StatefulWidget {
  const Road_map() : super();

  @override
  State<Road_map> createState() => _Road_mapState();
}

class _Road_mapState extends State<Road_map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Road Map',
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Constants.primaryColor,
            ),
          ),
        ),
        body: SfPdfViewer.network(
            "https://ext.agripunjab.gov.pk/system/files/WHEAT_2018-19.pdf"));
  }
}
