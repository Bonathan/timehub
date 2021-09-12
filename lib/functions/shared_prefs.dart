import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

void saveSupabaseSession(supabaseSession) async {
  //initialize shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //create shared preference supabaseSession to store the session
  prefs.setString('', supabaseSession);
}