class AllClothes {
  List<Data>? data;
  List<String>? categories;

  AllClothes({this.data, this.categories});

  AllClothes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    categories = json['categories'].cast<String>();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   data['categories'] = this.categories;
  //   return data;
  // }
}

class Data {
  int? id;
  String? category;
  String? title;
  String? image;
  String? type;

  Data({this.id, this.category, this.title, this.image, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['category'] = this.category;
  //   data['title'] = this.title;
  //   data['image'] = this.image;
  //   data['type'] = this.type;
  //   return data;
  // }
}