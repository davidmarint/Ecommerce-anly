class AddToCardReq {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImageUrl;
  final String createdDate;

  AddToCardReq({
    required this.productId, 
    required this.productTitle, 
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImageUrl,
    required this.createdDate,
    });
    
    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImageUrl': productImageUrl,
      'createdDate': createdDate,
    };
  }

}