import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/scan/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ScanMobilePortrait extends BaseModelWidget<ScanViewModel> {
  @override
  Widget build(BuildContext context, ScanViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return scanWidgetBuilder(height, data, context);
  }
}

class ScanMobileLandscape extends BaseModelWidget<ScanViewModel> {
  @override
  Widget build(BuildContext context, ScanViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return scanWidgetBuilder(height, data, context);
  }
}

Container scanWidgetBuilder(double height, ScanViewModel data, BuildContext context) {
  return Container(
    height: height * 0.75,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (data.state == ViewState.Processing)
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(primaryColour),
              ),
            ),
          )
        else
          Expanded(
            child: data.camState == true
                ? Center(
                    child: SizedBox(
                      width: 300.0,
                      height: 600.0,
                      child: data.qrCodeSuccess == true
                          ? Center(
                              child: Text(data.qrCodeMessage),
                            )
                          : QrCamera(
                              onError: (context, error) => Text(
                                error.toString(),
                                style: TextStyle(color: Colors.red),
                              ),
                              qrCodeCallback: (code) => _scanQRCode(code, data, context),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 5.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  )
                : Center(
                    child: Text("Camera inactive"),
                  ),
          ),
        if (data.qrCodeFail == true)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(data.qrCodeMessage),
          ),
      ],
    ),
  );
}

void _scanQRCode(String code, ScanViewModel data, BuildContext context) {
  data.scanQRCode(code).then((message) {
    Flushbar(
      title: message.title,
      message: message.message.replaceAll('[', '').replaceAll(']', ''),
      backgroundColor: Color(message.colour),
      duration: Duration(seconds: message.status != 200 ? 7 : 3),
    )..show(context).then(
        (_) {
          // Send the user to the Initial Application Screen on success.
          if (message.status == 200) {
            data.clearPage();
          }
        },
      );
  });
}
