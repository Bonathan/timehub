import 'package:flutter/cupertino.dart';
import 'package:supabase/supabase.dart';
import 'package:timehub/private_keys.dart' as privatekeys;

final TextEditingController supabaseEmail = TextEditingController();
final TextEditingController supabasePasswd = TextEditingController();
var session;

final client = SupabaseClient(privatekeys.supabaseKey, privatekeys.supabaseUrl);

void initSupabase() async {
  final response = await client.auth.signUp(supabaseEmail.text, supabasePasswd.text);
  if (response.error != null) {
    print('Error occured in the supabase function. ${response.error?.message}');
  } else {
    print('Success: ${response.data}');
  }
}
