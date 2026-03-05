import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInitializer {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://bujrbmvgnqtqcxbwldjr.supabase.co',
      anonKey: 'sb_publishable__K75AahRcujkOWB7tz1OQA_Y8L58IEY',
    );
  }
}