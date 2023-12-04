import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String firstName        = '';
  String lastName         = '';
  String secondLastName   = '';
  String email            = '';
  String phoneNumber      = '';
  String password         = '';
  String confirmPassword  = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validateForm() {
    print(formKey.currentState?.validate());

    print('$firstName - $lastName - $secondLastName - $email - $phoneNumber - $password - $confirmPassword');

    return formKey.currentState?.validate() ?? false;
  }

}