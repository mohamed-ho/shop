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
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key, required this.productModal});
  ProductModal productModal;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  bool editMode = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late ProductCategoryModel dropdownValue;
  List<ProductCategoryModel>? categories;
  late ProductModal tempProduct;
  bool isLoading = false;
  @override
  void initState() {
    ls<CategoryRemoteDataSource>().getCategories().then((value) {
      categories = value;
      dropdownValue =
          value.where((e) => e.id == widget.productModal.category).first;
      setState(() {});
    });

    titleController.text = widget.productModal.title;
    descriptionController.text = widget.productModal.description;
    imageController.text = widget.productModal.image;
    priceController.text = widget.productModal.price.toString();
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
              widget.productModal = ProductModal.clone(tempProduct);
            });
          }
        },
        child: Scaffold(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                  imageUrl: widget.productModal.image),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        if (editMode) {
                                          titleController.text =
                                              widget.productModal.title;
                                          descriptionController.text =
                                              widget.productModal.description;
                                          imageController.text =
                                              widget.productModal.image;
                                          priceController.text = widget
                                              .productModal.price
                                              .toString();
                                        }
                                        editMode = !editMode;
                                      });
                                    },
                                    label:
                                        Text(editMode ? 'Cancel' : 'Edit Mode'),
                                    icon: Icon(
                                        editMode ? Icons.cancel : Icons.edit),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: editMode
                                            ? Colors.red
                                            : Colors.green,
                                        foregroundColor: Colors.white),
                                  ))
                            ],
                          ),
                          editMode
                              ? AdminProductCustomTextFormField(
                                  valid: true,
                                  controller: imageController,
                                  hintText: "Product Image URL",
                                  validation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please Enter Image URL";
                                    } else if (!value.contains('http')) {
                                      return "please Enter valid URL";
                                    }
                                    return null;
                                  })
                              : const SizedBox(),
                          AdminProductCustomTextFormField(
                              valid: editMode,
                              hintText: 'Product Title',
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter product Title";
                                }
                                return null;
                              },
                              controller: titleController),
                          AdminProductCustomTextFormField(
                              valid: editMode,
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
                          categories == null
                              ? const Text("waiting.....")
                              : editMode
                                  ? DropdownButtonFormField(
                                      dropdownColor: Colors.white,
                                      items: categories!
                                          .map((e) => DropdownMenuItem<
                                                  ProductCategoryModel>(
                                              value: e, child: Text(e.name)))
                                          .toList(),
                                      value: dropdownValue,
                                      onChanged: (value) {
                                        dropdownValue = value!;
                                      },
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: Text(
                                        '${categories!.where((e) => e.id == widget.productModal.category).first.name} Category',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                          AdminProductCustomTextFormField(
                              valid: editMode,
                              maxLine: 6,
                              hintText: "product description",
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter product Title";
                                }
                                return null;
                              },
                              controller: descriptionController),
                          editMode
                              ? Builder(builder: (context) {
                                  return CustomElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          tempProduct = ProductModal(
                                              rate: widget.productModal.rate,
                                              id: widget.productModal.id,
                                              title: titleController.text,
                                              price: double.parse(
                                                  priceController.text),
                                              description:
                                                  descriptionController.text,
                                              category: dropdownValue.id,
                                              image: imageController.text);
                                          BlocProvider.of<ProductCubit>(context)
                                              .updateProduct(
                                                  product: tempProduct);
                                        }
                                      },
                                      buttonText: "Edit Product");
                                })
                              : const SizedBox(),
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
