import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:shop/features/home/domain/entities/category.dart';
import 'package:shop/features/home/presentation/cubit/cubit/category_cubit.dart';

class CustomCategoryBottomSheet extends StatelessWidget {
  CustomCategoryBottomSheet({super.key, this.category});
  final ProductCategory? category;
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (category != null) {
      nameController.text = category!.name;
      imageController.text = category!.image;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SizedBox(
        height: .5.sh,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                category == null ? 'Add Category' : 'Update Category',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              CustomTextFormField(
                  hintText: 'Category Name',
                  labelText: 'Category Name',
                  suffixIcon: const Icon(
                    Icons.widgets_outlined,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enterCategory Name";
                    }
                    return null;
                  },
                  controller: nameController),
              CustomTextFormField(
                hintText: 'Enter Image URL',
                labelText: 'Enter Image URL',
                suffixIcon: const Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please Image URL";
                  } else if (!value.contains('http')) {
                    return "please Enter valid URL";
                  }
                  return null;
                },
                controller: imageController,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    if (category != null) {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<CategoryCubit>(context).updateCategory(
                            category: ProductCategory(
                                id: category!.id,
                                image: imageController.text,
                                name: nameController.text));
                        Navigator.pop(context);
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<CategoryCubit>(context).addCategory(
                            category: ProductCategory(
                                id: 1,
                                image: imageController.text,
                                name: nameController.text));
                        Navigator.pop(context);
                      }
                    }
                  },
                  buttonText:
                      category == null ? 'Create Category' : 'Update Category')
            ],
          ),
        ),
      ),
    );
  }
}
