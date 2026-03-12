import 'package:uuid/uuid.dart';

class DeviceService {
  static final String deviceId = const Uuid().v4();
}