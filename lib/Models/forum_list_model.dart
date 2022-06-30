import '../libs.dart';

part 'forum_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ForumListModel {
  late List<ForumModel> forums;

  ForumListModel({required this.forums});

  factory ForumListModel.fromJson(Map<String, dynamic> json) => _$ForumListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForumListModelToJson(this);
}