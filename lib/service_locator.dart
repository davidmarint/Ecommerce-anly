
import 'package:ecommerce_anly/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_anly/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_anly/data/category/repository/category.dart';
import 'package:ecommerce_anly/data/category/source/category_firebase_sevice.dart';
import 'package:ecommerce_anly/data/order/repository/order.dart';
import 'package:ecommerce_anly/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_anly/data/product/repository/product.dart';
import 'package:ecommerce_anly/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/domain/auth/useCase/get_ages.dart';
import 'package:ecommerce_anly/domain/auth/useCase/get_user.dart';
import 'package:ecommerce_anly/domain/auth/useCase/is_logged_in.dart';
import 'package:ecommerce_anly/domain/auth/useCase/send_password_reset_email.dart';
import 'package:ecommerce_anly/domain/auth/useCase/signin.dart';
import 'package:ecommerce_anly/domain/auth/useCase/signup.dart';
import 'package:ecommerce_anly/domain/category/repository/category.dart';
import 'package:ecommerce_anly/domain/category/usecases/get_categories.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/domain/order/usecases/add_to_card.dart';
import 'package:ecommerce_anly/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce_anly/domain/order/usecases/order_registration.dart';
import 'package:ecommerce_anly/domain/order/usecases/remove_cart_products.dart';
import 'package:ecommerce_anly/domain/product/repository/product.dart';
import 'package:ecommerce_anly/domain/product/usecases/add_or_remove_favorite_product.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_favorites_products.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_products_by_category.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_products_by_title.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce_anly/domain/product/usecases/is_favorite.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

//services

sl.registerSingleton<AuthFirebaseService>(
  AuthFirebaseServiceImpl()
);

sl.registerSingleton<CategoryFirebaseSevice>(
  CategoryFirebaseSeviceImpl()
);

sl.registerSingleton<ProductFirebaseService>(
  ProductFirebaseServiceImpl()
);

sl.registerSingleton<OrderFirebaseService>(
  OrderFirebaseServiceImpl()
);

//repositories

sl.registerSingleton<AuthRepository>(
  AuthRepositoryImpl()
);

sl.registerSingleton<CategoryRepository>(
  CategoryRepositoryImpl());

sl.registerSingleton<ProductRepository>(
  ProductRepositoryImpl());

sl.registerSingleton<OrderRepository>(
  OrderRepositoryImpl());


//usecases

 sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
 );

sl.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase()
 );

 sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
 );

 sl.registerSingleton<SendPasswordUseCase>(
    SendPasswordUseCase()
 );

sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
 );

 sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
 );

sl.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase()
 );

sl.registerSingleton<GetTopSellingUseCase>(
    GetTopSellingUseCase()
 );
 
sl.registerSingleton<GetNewInUseCase>(
    GetNewInUseCase()
 );

sl.registerSingleton<GetProductsByCategoryUseCase>(
    GetProductsByCategoryUseCase()
 );

sl.registerSingleton<GetProductsByTitleUseCase>(
    GetProductsByTitleUseCase()
 );

sl.registerSingleton<AddToCardUseCase>(
    AddToCardUseCase()
 );

 sl.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase()
 );

  sl.registerSingleton<RemoveCartproductsUseCase>(
      RemoveCartproductsUseCase()
  );

  sl.registerSingleton<OrderRegistrationUseCase>(
      OrderRegistrationUseCase()
  );

  sl.registerSingleton<AddOrRemoveFavoriteProductUseCase>(
      AddOrRemoveFavoriteProductUseCase()
  );
  sl.registerSingleton<IsFavoriteUseCase>(
      IsFavoriteUseCase()
  );
  sl.registerSingleton<GetFavortiesProductsUseCase>(
      GetFavortiesProductsUseCase()
  );
}