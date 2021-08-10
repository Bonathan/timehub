import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:timehub/private_keys.dart' as privatekeys;

var supabaseEmail = 'bittner.jf@gmail.com';
var supabasePasswd = '1234567890';

void initSupabase() async {
	final client = SupabaseClient(privatekeys.supabaseUrl, privatekeys.supabaseKey);

	try {
		final response = await client
				.auth
				.signUp(supabaseEmail, supabasePasswd);
			} catch (e) {
				print('Error occured in: Supabase-Auth.\nError: ${e} \nContinuing...');
		}
}
