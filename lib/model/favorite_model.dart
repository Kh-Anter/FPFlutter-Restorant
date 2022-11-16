class favoritemodel {
  String name;
  String price;
  String itemid;
  String description;
  String pic;


  favoritemodel(this.name, this.price, this.itemid, this.description, this.pic);

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'price': price,
      'itemid': itemid,
      'description': description,
      'pic': pic,
    };
  }
}