import 'package:supabase/supabase.dart';
import 'package:timehub/private_keys.dart' as privatekeys;
import 'package:timehub/globals/auth.dart' as auth;

var supabaseEmail = 'bittner.jf@gmail.com';
var supabasePasswd = '1234567890';
var session;

final client = SupabaseClient(privatekeys.supabaseKey, privatekeys.supabaseUrl);

void initSupabase() async {
		final response = await client
				.auth
				.signUp(supabaseEmail, supabasePasswd);
		if (response.error != null) {
			print('Error occured in the supabase function. ${response.error?.message}');
		} else {
			print('Success: ${response.data}');
	}
}
