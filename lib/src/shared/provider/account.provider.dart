import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDTO {
  String? email;
  String? password;

  AccountDTO(email, password);
}

class AccountProvider extends ChangeNotifier {

  late AccountDTO accountInfo;

  void setAccountCredentials(AccountDTO accountInfo) {
    this.accountInfo = accountInfo;

    notifyListeners();
  }

  String getEmail () {
    return accountInfo.email ?? "no-email-provided";
  }

  String getPassword () {
    return accountInfo.password ?? "no-password-provided";
  }

}
