import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/customer_repository.dart';

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepository();
});