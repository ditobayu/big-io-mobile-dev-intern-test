import 'package:adhitya/features/characters/domain/entities/page_info.dart';

class PageInfoModel extends PageInfoEntity {
  const PageInfoModel({
    super.count,
    super.pages,
    super.next,
    super.prev,
  });

  factory PageInfoModel.fromJson(Map<String, dynamic> json) {
    return PageInfoModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }
}
