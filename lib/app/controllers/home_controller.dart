import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/home_model.dart';
import '../services/network_service.dart';

enum NetworkStatus { initial, loading, success, error }

class HomeController extends GetxController {
  final NetworkService _service = NetworkService();

  final Rx<NetworkStatus> status = NetworkStatus.initial.obs;
  final Rx<HomeModel?> apod = Rx<HomeModel?>(null);
  final RxString errorMessage = ''.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  bool get isLoading => status.value == NetworkStatus.loading;
  bool get hasData =>
      status.value == NetworkStatus.success && apod.value != null;
  bool get hasError => status.value == NetworkStatus.error;

  String get formattedSelectedDate {
    final d = selectedDate.value;
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  @override
  void onInit() {
    super.onInit();
    fetchApod();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  Future<void> fetchApod() async {
    debugPrint('Called for date: $formattedSelectedDate');
    status.value = NetworkStatus.loading;
    errorMessage.value = '';

    try {
      final result = await _service.fetchHomeData(formattedSelectedDate);
      apod.value = result;
      status.value = NetworkStatus.success;
      debugPrint(
        'Success — title: "${result.title}" | media: ${result.mediaType}',
      );
    } catch (e, stackTrace) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      status.value = NetworkStatus.error;
      debugPrint('ERROR: $e');
      debugPrint('StackTrace: $stackTrace');
    }
  }
}
