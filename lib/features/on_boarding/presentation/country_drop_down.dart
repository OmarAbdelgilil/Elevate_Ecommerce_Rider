import 'package:elevate_ecommerce_driver/features/login/domain/models/country.dart';
import 'package:elevate_ecommerce_driver/features/on_boarding/presentation/on_boarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDropDown extends StatefulWidget {
  final OnBoardingViewModel viewModel;
  const CountryDropDown({super.key, required this.viewModel});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[800]!,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButton<Country>(
          value: widget.viewModel.dropdownvalue,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: widget.viewModel.countries.map((Country items) {
            return DropdownMenuItem(
              value: items,
              child: Row(
                children: [
                  Text(items.flag,
                      style: TextStyle(
                        fontSize: 18.sp,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      items.name,
                      style: TextStyle(
                          fontSize: 18.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (Country? newValue) {
            setState(() {
              widget.viewModel.dropdownvalue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
