import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/feature/search/presentation/view_model/cubit/search_cubit.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? brand;
  String? category;
  String? rating;
  String? price;
  String? discount;
  bool? popular;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              "Filter Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Brand"),
              items: ["Apple", "Samsung", "Huawei"]
                  .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                  .toList(),
              onChanged: (val) => setState(() => brand = val),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Category"),
              items: ["smartphones", "laptops", "accessories"]
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => category = val),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Price"),
              items: ["up", "down"]
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => price = val),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Rating"),
              items: ["up", "down"]
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => rating = val),
            ),
            SwitchListTile(
              title: const Text("Popular"),
              value: popular ?? false,
              onChanged: (val) => setState(() => popular = val),
            ),

            const SizedBox(height: 20),

            // Apply Button
            ElevatedButton(
              onPressed: () {
                context.read<SearchCubit>().filtering(
                      query: null,
                      brand: brand,
                      category: category,
                      rating: rating,
                      price: price,
                      discount: discount,
                      popular: popular,
                    );
                Navigator.pop(context); 
              },
              child: const Text("Apply"),
            ),
          ],
        ),
      ),
    );
  }
}