import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key,
      required this.size,
      required this.onChnage,
      this.isRounded = true});

  final List<String> size;
  final Function(String) onChnage;
  final bool isRounded;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.size.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectdIndex = index;
              widget.onChnage(widget.size[index]);
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                width: widget.isRounded ? 40 : null,
                alignment: Alignment.center,
                 decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedTextColor(index == selectdIndex),
                  ),
                  borderRadius: BorderRadius.circular(100),
                  color: _selectedBackgroudColor(index == selectdIndex),
                ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.size[index],
                      style: TextStyle(
                          color: _selectedTextColor(index == selectdIndex)),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _selectedTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _selectedBackgroudColor(bool isSelected) {
    return isSelected ? AppColors.primaryColor : Colors.transparent;
  }
}
