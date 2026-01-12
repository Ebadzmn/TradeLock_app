import 'package:get/get.dart';

class AddJobController extends GetxController {
  var isReminderEnabled = true.obs;
  var startTime = '09:00'.obs;
  var endTime = '11:30'.obs;
  var remindTime = '30 minutes before'.obs;
}
