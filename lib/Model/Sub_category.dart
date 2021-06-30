class Sub_category {
  String sub_cat_id;
  String sub_cat_name;
  String sub_cate_img;

  Sub_category({
    this.sub_cat_id,
    this.sub_cat_name,
    this.sub_cate_img,
  });

  Sub_category.fromJson(Map<String, dynamic> json) {
    sub_cat_id = json['id'];
    sub_cat_name = json['title'];
    sub_cate_img = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.sub_cat_id;
    data['title'] = this.sub_cat_name;
    data['image'] = this.sub_cate_img;
    return data;
  }
}