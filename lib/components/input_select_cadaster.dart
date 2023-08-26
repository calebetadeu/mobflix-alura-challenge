import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/selected_category_model.dart';

class InputSelectedCadaster extends StatefulWidget {
  const InputSelectedCadaster({
    Key? key,
    required this.label,
    required this.hint,
    required this.categoryList,
    required this.initialValue,
  }) : super(key: key);

  final String label;
  final String hint;
  final List<SelectedCategoryModel> categoryList;
  final SelectedCategoryModel initialValue;

  @override
  _InputSelectedCadasterState createState() => _InputSelectedCadasterState();
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
              child: DropdownButton<SelectedCategoryModel>(
                isExpanded: true,
                value: _selectedOption,
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
                underline: Container(
                  height: 0,
                  color: Colors.blue.shade900,
                ),
                onChanged: (SelectedCategoryModel? newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                  });
                },
                items: widget.categoryList
                    .map<DropdownMenuItem<SelectedCategoryModel>>(
                  (SelectedCategoryModel value) {
                    return DropdownMenuItem<SelectedCategoryModel>(
                      value: value,
                      child: Text(value.categoryName),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
