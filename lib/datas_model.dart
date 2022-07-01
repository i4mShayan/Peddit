import 'libs.dart';


part 'datas_model.g.dart';


@JsonSerializable(explicitToJson: true)
class DatasModel{
  late List<ForumModel> forumsList;

  DatasModel(List<ForumModel> forumsList) {
    this.forumsList = forumsList;
  }
  factory DatasModel.fromJson(Map<String, dynamic> json) => _$DatasModelFromJson(json);
  Map<String, dynamic> toJson() => _$DatasModelToJson(this);
}