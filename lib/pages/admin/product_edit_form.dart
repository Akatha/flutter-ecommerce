import 'dart:io';

import 'package:async_provider/commonwidget/toast_show.dart';
import 'package:async_provider/constants/apis.dart';
import 'package:async_provider/provider/product/product_provider.dart';
import 'package:async_provider/shared/image_provider.dart';
import 'package:async_provider/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../models/product.dart';

const List<String> categories = ['mobile', 'laptop', 'tv', 'camera', 'clothes'];
const List<String> brands = [
  'apple',
  'samsung',
  'oppo',
  'hp',
  'dell',
  'gucci',
  'adidas',
];

class ProductEditForm extends ConsumerStatefulWidget {
  final Product product;
  const ProductEditForm({super.key, required this.product});

  @override
  ConsumerState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends ConsumerState<ProductEditForm> {
  final _form = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(validateModeProvider(id: 3));
    final image = ref.watch(imageProviderProvider);
    final productsState = ref.watch(productsStateProvider);

    ref.listen(productsStateProvider, (prev, next){
      next.maybeWhen(
          data: (d){
            ref.invalidate(getProductsProvider);
            context.pop();
            showToast(context, 'Successfully product  updated successfully');
          },
          error: (err, st)=> showToast(context, '$err'),
          orElse:() =>null );
    });
    return Scaffold(
      appBar: AppBar(),
      body: FormBuilder(
        key: _form,
        autovalidateMode: mode,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              FormBuilderTextField(
                name: 'title',
                initialValue: widget.product.title,
                decoration: InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 15),
              FormBuilderTextField(
                name: 'price',
                initialValue: widget.product.price.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'price',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),

              const SizedBox(height: 15),
              FormBuilderDropdown<String>(
                name: 'category',
                initialValue: widget.product.category,

                decoration: InputDecoration(border: OutlineInputBorder()),
                items:
                categories.map((e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),

              const SizedBox(height: 15),
              FormBuilderDropdown<String>(
                name: 'brand',
                initialValue: widget.product.brand,

                decoration: InputDecoration(border: OutlineInputBorder()),
                items:
                brands.map((e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),

              const SizedBox(height: 15),
              FormBuilderTextField(
                maxLines: 4,
                name: 'description',
                initialValue: widget.product.description,
                decoration: InputDecoration(
                  hintText: 'description',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 10),

              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  ref.read(imageProviderProvider.notifier).pickAnImage();
                },
                child: Container(
                  height: 100,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child:  image == null ?  Image.network('$base/${widget.product.image}'):Image.file(File(image.path)),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: productsState.isLoading ? null:() {

                FocusScope.of(context).unfocus();
                if(_form.currentState!.saveAndValidate(focusOnInvalid: false)){
                  final map = _form.currentState!.value;
                  if(image == null){

                    ref.read(productsStateProvider.notifier).updateProduct(map: map, id: widget.product.id);

                  }else{
                    ref.read(productsStateProvider.notifier).updateProduct(map: map, image: image, id: widget.product.id);
                  }

                }
                else{
                  ref.read(validateModeProvider(id: 3).notifier).change();
                }

              }, child:productsState.isLoading ?Center(child: CircularProgressIndicator(),): Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
