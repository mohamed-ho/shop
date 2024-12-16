import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/auth/presentation/widgets/custom_text_form_field.dart';

class NameSignupBlocWidget extends StatelessWidget {
  const NameSignupBlocWidget(
      {super.key,
      required this.firstNameController,
      required this.lastNameController});
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomTextFormField(
                  hintText: 'First Name',
                  labelText: "First Name",
                  suffixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter you first name ";
                    } else if (value.length < 3) {
                      return 'please enter valid Name';
                    }
                    return null;
                  },
                  controller: firstNameController),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 1,
              child: CustomTextFormField(
                  hintText: 'Last Name',
                  labelText: "Last Name",
                  suffixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter you last name";
                    } else if (value.length < 3) {
                      return 'please enter valid Name';
                    }
                    return null;
                  },
                  controller: lastNameController),
            ),
          ],
        )
      ],
    );
  }
}
