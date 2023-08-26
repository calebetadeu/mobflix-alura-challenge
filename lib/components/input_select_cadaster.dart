import 'package:flutter/material.dart';

import '../model/selected_category_model.dart';

class InputSelectedCadaster extends StatefulWidget {
  const InputSelectedCadaster(
      {Key? key,
      required this.label,
      required this.hint,
      required this.categoryList,
      required this.initialValue,
      this.onChanged})
      : super(key: key);

  final String label;
  final String hint;
  final List<SelectedCategoryModel> categoryList;
  final SelectedCategoryModel initialValue;
  final ValueChanged<SelectedCategoryModel?>? onChanged;
  @override
  State<InputSelectedCadaster> createState() => _InputSelectedCadasterState();
}

class _InputSelectedCadasterState extends State<InputSelectedCadaster> {
  late SelectedCategoryModel _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.label} :",
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12.0),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<SelectedCategoryModel>(
                  isExpanded: true,
                  value: _selectedOption.categoryName.isNotEmpty
                      ? _selectedOption
                      : null,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  dropdownColor: Colors.blue.shade900,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                  onChanged: (SelectedCategoryModel? newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(newValue);
                    }
                  },
                  items: widget.categoryList.map((item) {
                    return DropdownMenuItem<SelectedCategoryModel>(
                      value: item,
                      child: Container(
                        color: Colors.blue.shade900,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.categoryName,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
