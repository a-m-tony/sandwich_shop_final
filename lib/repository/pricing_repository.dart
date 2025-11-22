import 'package:myapp/model/sandwich.dart';

 
      
  class PricingRepository {
        double getPrice(Sandwich sandwich) {
          // Check if the sandwich size is footlong
          double basePrice = sandwich.size == SandwichSize.footlong ? 11.0 : 7.0;
          return basePrice;
        }
      
        double calculatePrice({required int quantity, required bool isFootlong}) {
         if (quantity < 0) {
           throw ArgumentError('Quantity cannot be negative');
         }
         double basePrice = isFootlong ? 11.0 : 7.0;
         return basePrice * quantity;
       }
  }


// class PricingRepository {
//   double getPrice(Sandwich sandwich) {
//     double basePrice = sandwich.isFootlong ? 11.0 : 7.0;
//     return basePrice;
//   }

//   double calculatePrice({required int quantity, required bool isFootlong}) {
//     if (quantity < 0) {
//       throw ArgumentError('Quantity cannot be negative');
//     }
//     double basePrice = isFootlong ? 11.0 : 7.0;
//     return basePrice * quantity;
//   }
// }
