import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/admin/presentation/widgets/admin_product_custom_text_Form_field.dart';
import 'package:shop/features/home/data/datasources/category_remote_data_source.dart';
import 'package:shop/features/home/data/models/product_category_model.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/data/models/rate_model.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late ProductCategoryModel dropdownValue;
  List<ProductCategoryModel>? categories;
  bool isLoading = true;
  @override
  void initState() {
    ls<CategoryRemoteDataSource>().getCategories().then((value) {
      categories = value;
      dropdownValue = value.last;
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<ProductCubit>(),
      child: BlocListener<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadingState) {
            setState(() {
              isLoading = true;
            });
          } else if (state is ProductErrorState) {
            setState(() {
              isLoading = false;
            });
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.message),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'))
                      ],
                    ));
          } else if (state is ProductLoadedstate) {
            setState(() {
              isLoading = false;
              Navigator.pop(context);
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: const Text('Add Product'),
            centerTitle: true,
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                              imageUrl: imageController.text,
                              errorWidget: (context, url, error) {
                                return const SizedBox();
                              },
                              maxHeightDiskCache: .5.sw.floor()),
                          AdminProductCustomTextFormField(
                              valid: true,
                              hintText: 'Product Title',
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter product Title";
                                }
                                return null;
                              },
                              controller: titleController),
                          AdminProductCustomTextFormField(
                              valid: true,
                              hintText: 'Price',
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter product Title";
                                } else if (double.tryParse(value) == null) {
                                  return 'please enter valid price';
                                }
                                return null;
                              },
                              controller: priceController),
                          AdminProductCustomTextFormField(
                              valid: true,
                              hintText: "product description",
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter product Title";
                                }
                                return null;
                              },
                              controller: descriptionController),
                          SizedBox(
                            height: 20.h,
                          ),
                          DropdownButtonFormField(
                            
                            decoration: InputDecoration(
                                label: const Text('choose category'),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                fillColor: Colors.transparent,
                                filled: true),
                            dropdownColor: Colors.white,
                            items: categories!
                                .map((e) =>
                                    DropdownMenuItem<ProductCategoryModel>(
                                        value: e, child: Text(e.name)))
                                .toList(),
                            value: dropdownValue,
                            onChanged: (value) {
                              dropdownValue = value!;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AdminProductCustomTextFormField(
                              valid: true,
                              onChanged: (p0) {
                                setState(() {
                                  imageController.text = p0;
                                  print(p0);
                                });
                              },
                              controller: imageController,
                              hintText: "Product Image URL",
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please Enter Image URL";
                                } else if (!value.contains('http')) {
                                  return "please Enter valid URL";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 15.h,
                          ),
                          Builder(builder: (context) {
                            return CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<ProductCubit>(context)
                                        .addNewProduct(
                                            product: ProductModal(
                                                rate: RateModel(
                                                    rate: 0, count: 0),
                                                id: 0,
                                                title: titleController.text,
                                                price: double.parse(
                                                    priceController.text),
                                                description:
                                                    descriptionController.text,
                                                category: dropdownValue.id,
                                                image: imageController.text));
                                  }
                                },
                                buttonText: "Edit Product");
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
