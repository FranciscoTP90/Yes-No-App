import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool force;
  final String image;

  YesNoModel({
    required this.answer,
    required this.force,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json["answer"],
      force: json["force"],
      image: json["image"],
    );
  }

  Message toMessageEntity() {
    return Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image,
    );
  }
}
