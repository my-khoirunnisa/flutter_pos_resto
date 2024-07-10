// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pos_resto_fic14/data/models/response/product_response_model.dart';

class ProductQuantity {
  final Product product;
  int quantity;
  ProductQuantity({
    required this.product,
    required this.quantity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductQuantity &&
      other.product == product &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
