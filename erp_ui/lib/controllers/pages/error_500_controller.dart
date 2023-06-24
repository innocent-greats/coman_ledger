import 'package:flatten/controllers/my_controller.dart';

class Error500Controller extends MyController {
  @override
  String getTag() {
    return "error_500_controller";
  }
}
