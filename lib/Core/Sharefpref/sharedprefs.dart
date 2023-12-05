import "dart:convert";

import"package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
class SharedPreference {
  static saveUser(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    //We cannot save custom objects.
    //So json.encode is used to convert User Object to Json a string.
    prefs.setString(key, json.encode(value));
  }
  static readUser(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    //json.decode to convert json string back to Json Object
    return json.decode(prefs.getString(key!)!);
  }
  static removeUser(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}