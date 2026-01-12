import 'package:get/get.dart';

class CountrySelectionController extends GetxController {
  final selectedCountry = 'United Kingdom'.obs;

  final List<String> countries = [
    'Australia',
    'Belgium',
    'Canada',
    'Denmark',
    'France',
    'Germany',
  ];

  void selectCountry(String country) {
    selectedCountry.value = country;
  }
}
