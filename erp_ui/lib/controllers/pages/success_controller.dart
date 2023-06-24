import 'package:flatten/controllers/my_controller.dart';
import 'package:flutx/flutx.dart';

class SuccessController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => FxTextUtils.getDummyText(60));

  @override
  String getTag() {
    return "success_controller";
  }
}
