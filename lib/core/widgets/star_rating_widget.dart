import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final double rating; // The rating as a double
  final double starSize; // The size of each star
  final int maxStars; // The maximum number of stars

  const StarRatingWidget({
    Key? key,
    required this.rating,
    this.starSize = 24.0, // Default star size
    this.maxStars = 5, // Default to 5 stars
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        if (rating >= index + 1) {
          // Full star
          return Icon(
            Icons.star,
            size: starSize,
            color: Colors.amber,
          );
        } else if (rating > index && rating < index + 1) {
          // Half star
          return Icon(
            Icons.star_half,
            size: starSize,
            color: Colors.amber,
          );
        } else {
          // Empty star
          return Icon(
            Icons.star_border,
            size: starSize,
            color: Colors.grey,
          );
        }
      }),
    );
  }
}
