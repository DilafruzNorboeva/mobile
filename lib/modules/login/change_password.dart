import 'package:flutter/material.dart';

import '/language/local_language.dart';
import '/widgets/common_appbar_view.dart';
import '/widgets/common_button.dart';
import '/widgets/common_text_field_view.dart';
import '/widgets/remove_focuse.dart';

class ChangepasswordScreen extends StatefulWidget {
  @override
  _ChangepasswordScreenState createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  String _errorNewPassword = '';
  String _errorConfirmPassword = '';
  TextEditingController _newController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.arrow_back,
              titleText: LocalLanguage(context).of("change_password"),
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 24, right: 24),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              LocalLanguage(context)
                                  .of("enter_your_new_password"),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonTextFieldView(
                      controller: _newController,
                      titleText: LocalLanguage(context).of("new_password"),
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                      hintText: LocalLanguage(context).of('enter_new_password'),
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorNewPassword,
                    ),
                    CommonTextFieldView(
                      controller: _confirmController,
                      titleText: LocalLanguage(context).of("confirm_password"),
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                      hintText:
                          LocalLanguage(context).of("enter_confirm_password"),
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorConfirmPassword,
                    ),
                    CommonButton(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                      buttonText: LocalLanguage(context).of("Apply_text"),
                      onTap: () {
                        if (_allValidation()) {
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _allValidation() {
    bool isValid = true;
    if (_newController.text.trim().isEmpty) {
      _errorNewPassword = LocalLanguage(context).of('password_cannot_empty');
      isValid = false;
    } else if (_newController.text.trim().length < 6) {
      _errorNewPassword = LocalLanguage(context).of('valid_new_password');
      isValid = false;
    } else {
      _errorNewPassword = '';
    }
    if (_confirmController.text.trim().isEmpty) {
      _errorConfirmPassword =
          LocalLanguage(context).of('password_cannot_empty');
      isValid = false;
    } else if (_newController.text.trim() != _confirmController.text.trim()) {
      _errorConfirmPassword = LocalLanguage(context).of('password_not_match');
      isValid = false;
    } else {
      _errorConfirmPassword = '';
    }
    setState(() {});
    return isValid;
  }
}
