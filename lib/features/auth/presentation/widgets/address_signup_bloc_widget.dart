import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/auth/presentation/widgets/custom_text_form_field.dart';

class AddressSignupBlocWidget extends StatelessWidget {
  const AddressSignupBlocWidget(
      {super.key,
      required this.cityController,
      required this.streetController,
      required this.houseNumberController});
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController houseNumberController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Address Data ',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        CustomTextFormField(
            hintText: 'City',
            labelText: 'City',
            controller: cityController,
            suffixIcon: const Icon(
              Icons.location_city,
              color: Colors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter you city name";
              } else if (value.length < 3) {
                return 'please enter valid city name';
              }
              return null;
            }),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextFormField(
                  hintText: 'Street',
                  labelText: 'Street',
                  controller: streetController,
                  suffixIcon: const Icon(
                    Icons.route,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter you street name";
                    } else if (value.length < 3) {
                      return 'please enter valid street name';
                    }
                    return null;
                  }),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 1,
              child: CustomTextFormField(
                  hintText: 'house Number',
                  labelText: 'house Number',
                  controller: houseNumberController,
                  keyBoardType: TextInputType.number,
                  suffixIcon: const Icon(
                    Icons.house,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter you house number";
                    } else if (int.tryParse(value) == null) {
                      return 'please enter valid house number';
                    }
                    return null;
                  }),
            )
          ],
        )
      ],
    );
  }
}
