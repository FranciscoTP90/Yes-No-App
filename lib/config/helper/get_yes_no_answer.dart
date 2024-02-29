import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get("http://yesno.wtf/api");
    final yeNoModel = YesNoModel.fromJsonMap(response.data);

    // return Message(
    //   text: yeNoModel.answer,
    //   fromWho: FromWho.hers,
    //   imageUrl: yeNoModel.image,
    // );
    return yeNoModel.toMessageEntity();
  }
}
