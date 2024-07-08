import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDTO {
  String email;
  String password;

  AccountDTO({required this.email, required this.password});
}

class AccountProvider extends ChangeNotifier {

  final AccountDTO accountInfo = AccountDTO(email: '', password: '');
  AccountDTO get mapTests => accountInfo;

  void setAccountCredentials(AccountDTO accountInfoParams) {
    accountInfo.email = accountInfoParams.email;
    accountInfo.password = accountInfoParams.password;

    notifyListeners();
  }

  String getEmail () {
    return mapTests.email ?? "no-email-provided";
  }

  String getPassword () {
    return accountInfo.password ?? "no-password-provided";
  }

}
