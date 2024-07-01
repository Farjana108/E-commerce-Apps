import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChnage});

  final List<Color> colors;
  final Function(Color) onChnage;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int selectdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              selectdIndex=index;
              widget.onChnage(widget.colors[index]);
              setState(() {

              });
            },
            child: CircleAvatar(
              backgroundColor: widget.colors[index],
              child: selectdIndex == index ? Icon(Icons.check,color: Colors.white,) : null,
            ),
          );
        },
      ),
    );
  }
}
