class OrderResponse2 {
  String? message;
  Metadata? metadata;
  List<Orders>? orders;

  OrderResponse2({this.message, this.metadata, this.orders});

  OrderResponse2.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? totalPages;
  int? totalItems;
  int? limit;

  Metadata({this.currentPage, this.totalPages, this.totalItems, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['limit'] = limit;
    return data;
  }
}

class Orders {
  String? sId;
  String? driver;
  Order? order;
  int? iV;
  String? createdAt;
  String? updatedAt;
  Store? store;

  Orders(
      {this.sId,
      this.driver,
      this.order,
      this.iV,
      this.createdAt,
      this.updatedAt,
      this.store});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    driver = json['driver'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['driver'] = driver;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}

class Order {
  String? sId;
  User? user;
  List<OrderItems>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  int? iV;

  Order(
      {this.sId,
      this.user,
      this.orderItems,
      this.totalPrice,
      this.paymentType,
      this.isPaid,
      this.isDelivered,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.orderNumber,
      this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    data['paymentType'] = paymentType;
    data['isPaid'] = isPaid;
    data['isDelivered'] = isDelivered;
    data['state'] = state;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['orderNumber'] = orderNumber;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.photo});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['gender'] = gender;
    data['phone'] = phone;
    data['photo'] = photo;
    return data;
  }
}

class OrderItems {
  Product? product;
  int? price;
  int? quantity;
  String? sId;

  OrderItems({this.product, this.price, this.quantity, this.sId});

  OrderItems.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['price'] = price;
    data['quantity'] = quantity;
    data['_id'] = sId;
    return data;
  }
}

class Product {
  String? sId;
  int? price;

  Product({this.sId, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['price'] = price;
    return data;
  }
}

class Store {
  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;

  Store({this.name, this.image, this.address, this.phoneNumber, this.latLong});

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    latLong = json['latLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['latLong'] = latLong;
    return data;
  }
}
