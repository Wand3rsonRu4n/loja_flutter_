import 'package:aula_estado/constants/colors.dart';
import 'package:aula_estado/model/sizes_model.dart';
import 'package:flutter/material.dart';

class SizeContainer extends StatefulWidget {
  const SizeContainer({
    super.key,
  });

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: SizeData.sizeData.map((size) {
          return ChoiceChip(
            label: Text(size.indicator),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 4.0,
            ),
            selected: size.isSelected,
            onSelected: (value) {
              setState(() {
                SizeData.setIsSelected(size.indicator);
              });
            },
            selectedColor: kPrimaryColor,
            backgroundColor: kGreyColor,
            labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: size.isSelected ? Colors.white : kBlackColor,
                ),
          );
        }).toList(),
      ),
    );
  }
}

class SizeData {
  static List<SizeModel> sizeData = [
    SizeModel(
      indicator: "36",
      sizeName: "36",
      isAvailable: true,
    ),
    SizeModel(
      indicator: "38",
      sizeName: "38",
      isAvailable: true,
    ),
    SizeModel(
      indicator: "40",
      sizeName: "40",
      isAvailable: true,
    ),
    SizeModel(
      indicator: "42",
      sizeName: "42+",
      isAvailable: true,
    ),
  ];

  static void setIsSelected(String sizeIndicator) {
    for (var size in sizeData) {
      size.isSelected = size.indicator == sizeIndicator;
    }
  }
}
