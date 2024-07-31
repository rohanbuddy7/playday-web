
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'mixpanel_constants.dart';

import 'dart:js' as js;

class MixpanelController {
  static Mixpanel? mixpanel;
  static String? sessionid;

  static void trackAndroidClick() {
    try {
      var mixpanel = js.context['mixpanel'];
      if (mixpanel == null) {
        print("Mixpanel is not initialized.");
        return;
      }
      Map<String, dynamic> properties = {};
      mixpanel.callMethod('track', [
        MixpanelEventConstants.clickAndroid,
        js.JsObject.jsify(properties)
      ]);
      print("Event tracked successfully.");
    } catch (error) {
      print("Error tracking Mixpanel event: $error");
    }
  }


  static trackIosClick() {
    Map<String, dynamic> properties = {};
    js.context['mixpanel'].callMethod('track', [MixpanelEventConstants.clickIos, js.JsObject.jsify(properties)]);
  }

  static trackPrivacyClick() {
    Map<String, dynamic> properties = {};
    js.context['mixpanel'].callMethod('track', [MixpanelEventConstants.clickPrivacy, js.JsObject.jsify(properties)]);
  }

  static trackHelpClick() {
    Map<String, dynamic> properties = {};
    js.context['mixpanel'].callMethod('track', [MixpanelEventConstants.clickHelp, js.JsObject.jsify(properties)]);
  }

  static trackContactClick() {
    Map<String, dynamic> properties = {};
    js.context['mixpanel'].callMethod('track', [MixpanelEventConstants.clickContact, js.JsObject.jsify(properties)]);
  }

}
