import 'package:product_list/app/app.bottomsheets.dart';
import 'package:product_list/app/app.dialogs.dart';
import 'package:product_list/app/app.locator.dart';
import 'package:product_list/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  final List<Map<String, dynamic>> data = [
    {
      "image": {
        "thumbnail": "./assets/image-waffle-thumbnail.jpg",
        "mobile": "./assets/image-waffle-mobile.jpg",
        "tablet": "./assets/image-waffle-tablet.jpg",
        "desktop": "./assets/image-waffle-desktop.jpg"
      },
      "name": "Waffle with Berries",
      "category": "Waffle",
      "price": 6.50
    },
    {
      "image": {
        "thumbnail": "./assets/image-creme-brulee-thumbnail.jpg",
        "mobile": "./assets/image-creme-brulee-mobile.jpg",
        "tablet": "./assets/image-creme-brulee-tablet.jpg",
        "desktop": "./assets/image-creme-brulee-desktop.jpg"
      },
      "name": "Vanilla Bean Crème Brûlée",
      "category": "Crème Brûlée",
      "price": 7.00
    },
    {
      "image": {
        "thumbnail": "./assets/image-macaron-thumbnail.jpg",
        "mobile": "./assets/image-macaron-mobile.jpg",
        "tablet": "./assets/image-macaron-tablet.jpg",
        "desktop": "./assets/image-macaron-desktop.jpg"
      },
      "name": "Macaron Mix of Five",
      "category": "Macaron",
      "price": 8.00
    },
    {
      "image": {
        "thumbnail": "./assets/image-tiramisu-thumbnail.jpg",
        "mobile": "./assets/image-tiramisu-mobile.jpg",
        "tablet": "./assets/image-tiramisu-tablet.jpg",
        "desktop": "./assets/image-tiramisu-desktop.jpg"
      },
      "name": "Classic Tiramisu",
      "category": "Tiramisu",
      "price": 5.50
    },
    {
      "image": {
        "thumbnail": "./assets/image-baklava-thumbnail.jpg",
        "mobile": "./assets/image-baklava-mobile.jpg",
        "tablet": "./assets/image-baklava-tablet.jpg",
        "desktop": "./assets/image-baklava-desktop.jpg"
      },
      "name": "Pistachio Baklava",
      "category": "Baklava",
      "price": 4.00
    },
    {
      "image": {
        "thumbnail": "./assets/image-meringue-thumbnail.jpg",
        "mobile": "./assets/image-meringue-mobile.jpg",
        "tablet": "./assets/image-meringue-tablet.jpg",
        "desktop": "./assets/image-meringue-desktop.jpg"
      },
      "name": "Lemon Meringue Pie",
      "category": "Pie",
      "price": 5.00
    },
    {
      "image": {
        "thumbnail": "./assets/image-cake-thumbnail.jpg",
        "mobile": "./assets/image-cake-mobile.jpg",
        "tablet": "./assets/image-cake-tablet.jpg",
        "desktop": "./assets/image-cake-desktop.jpg"
      },
      "name": "Red Velvet Cake",
      "category": "Cake",
      "price": 4.50
    },
    {
      "image": {
        "thumbnail": "./assets/image-brownie-thumbnail.jpg",
        "mobile": "./assets/image-brownie-mobile.jpg",
        "tablet": "./assets/image-brownie-tablet.jpg",
        "desktop": "./assets/image-brownie-desktop.jpg"
      },
      "name": "Salted Caramel Brownie",
      "category": "Brownie",
      "price": 4.50
    },
    {
      "image": {
        "thumbnail": "./assets/image-panna-cotta-thumbnail.jpg",
        "mobile": "./assets/image-panna-cotta-mobile.jpg",
        "tablet": "./assets/image-panna-cotta-tablet.jpg",
        "desktop": "./assets/image-panna-cotta-desktop.jpg"
      },
      "name": "Vanilla Panna Cotta",
      "category": "Panna Cotta",
      "price": 6.50
    }
  ];

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
