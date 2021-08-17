import 'package:stacked/stacked.dart';


/*
* This class is used to model all the data needed in the Home View
 */

class HomeViewModel extends BaseViewModel {


  final _title = 'HNGi8 Stage 2 Task'; //The title variable
  // the variable hold the text user enter,
  var _enteredText = 'You wanna see some magic? Write in the box below.';

  //The getter get and retur the value of _enteredText
  String get enteredText => _enteredText;

  String get title => _title;

  // This function is used to update _enteredText
  //then notify all the listeners about the change
  void updateEnteredText(String text) {
    _enteredText = text;
    notifyListeners();
  }
}
