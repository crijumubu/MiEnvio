import 'dart:convert';

import 'package:flutter/material.dart';

class PlaceAutocompleteResponse{

  final String? status;
  final List<AutocompletePrediction>? predictions;

  PlaceAutocompleteResponse({this.status, this.predictions});

  factory PlaceAutocompleteResponse.fromJson(Map<String,dynamic>json){
    return PlaceAutocompleteResponse(
      status: json["status"] as String?,
      predictions: json["predictions"] != null ? 
      json["predictions"].map<AutocompletePrediction>(
        (json) => AutocompletePrediction.fromJson(json)).toList() : null,
      
    );
  }

  static PlaceAutocompleteResponse parseAutocompleteResult(String responseBody){
    final parsed = json.decode(responseBody).cast<String,dynamic>();

    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}

class AutocompletePrediction {
  final String? description;
  final StructuredFormatting? structuredFormatting;
  final String? placeId;
  final String? reference;

  AutocompletePrediction({this.placeId, this.reference, this.description, this.structuredFormatting});

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json){
    return AutocompletePrediction(
      description: json["description"] as String?,
      placeId: json["place_id"] as String?,
      reference: json["reference"] as String?,
      structuredFormatting: json["structured_formatting"] != null
      ? StructuredFormatting.fromJson(json["structured_formatting"]) : null,
    );
  }
  
}

class StructuredFormatting {
  final String? mainText;
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json){
    return StructuredFormatting(
      mainText: json["main_text"] as String?,
      secondaryText: json["secondary_text"] as String
    );
  }
}