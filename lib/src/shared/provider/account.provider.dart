import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountProviderDTO {
  int userId;
  String email;
  String password;

  AccountProviderDTO({required this.userId, required this.email, required this.password});
}

class AccountProvider extends ChangeNotifier {

  final AccountProviderDTO accountInfo = AccountProviderDTO(userId: 0, email: '', password: '');
  AccountProviderDTO get mapTests => accountInfo;

  void setAccountCredentials(AccountProviderDTO accountInfoParams) {
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
