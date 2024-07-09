import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDTO {
  int userId;
  String email;
  String password;

  AccountDTO({required this.userId, required this.email, required this.password});
}

class AccountProvider extends ChangeNotifier {

  final AccountDTO accountInfo = AccountDTO(userId: 0, email: '', password: '');
  AccountDTO get mapTests => accountInfo;

  void setAccountCredentials(AccountDTO accountInfoParams) {
    accountInfo.userId = accountInfoParams.userId;
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
