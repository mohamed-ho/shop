import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';

// For formatting dates

class SearchRangeWidget extends StatefulWidget {
  const SearchRangeWidget({super.key});

  @override
  _SearchRangeWidgetState createState() => _SearchRangeWidgetState();
}

class _SearchRangeWidgetState extends State<SearchRangeWidget> {
  DateTime? firstDate;
  DateTime? secondDate;

  // Function to pick a date
  Future<void> _pickFirstDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: firstDate ?? DateTime.now(),
      firstDate: DateTime(2000), // Allow dates starting from the year 2000
      lastDate: DateTime.now(), // Allow past dates only
    );

    if (pickedDate != null) {
      setState(() {
        firstDate = pickedDate;
        // Reset secondDate to ensure it's consistent with the new firstDate
        secondDate = null;
      });
    }
  }

  Future<void> _pickSecondDate(BuildContext context) async {
    if (firstDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select the first date first!')),
      );
      return;
    }

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: secondDate ?? firstDate!.add(const Duration(days: 1)),
      firstDate:
          firstDate!.add(const Duration(days: 1)), // Dates after firstDate
      lastDate: DateTime.now(), // Allow past dates only
    );

    if (pickedDate != null) {
      setState(() {
        secondDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("search by range date"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  firstDate != null
                      ? DateFormat('yyyy,MM,dd').format(firstDate!)
                      : 'Start',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                IconButton(
                    onPressed: () => _pickFirstDate(context),
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            Row(
              children: [
                Text(
                  secondDate != null
                      ? DateFormat('yyyy,MM,dd').format(secondDate!)
                      : 'end',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                IconButton(
                    onPressed: () => _pickSecondDate(context),
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            Visibility(
              visible: firstDate != null && secondDate != null,
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                        .getCartInRageDate(start: firstDate!, end: secondDate!);
                  },
                  icon: Icon(
                    Icons.search,
                    size: 25.w,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
