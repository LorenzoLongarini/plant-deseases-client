import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVars {
  static String get username => dotenv.get('USERNAME');
  static String get password => dotenv.get('PASSWORD');
}
