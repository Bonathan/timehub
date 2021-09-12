import 'package:flutter/cupertino.dart';
import 'package:supabase/supabase.dart';
import 'package:timehub/functions/shared_prefs.dart';
import 'package:timehub/private_keys.dart' as privatekeys;

var session;

final client = SupabaseClient(privatekeys.supabaseUrl, privatekeys.supabaseKey);

void supabaseLogin(email, passwd) async {
  final response =
      await client.auth.signUp(email, passwd);

  if (response.error != null) {
    // Error
    print('Error: ${response.error?.message}');
  } else {
    // Success
    final session = response.data;
    saveSupabaseSession(session!.persistSessionString);
  }
}