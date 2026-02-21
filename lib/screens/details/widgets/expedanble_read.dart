import 'package:flutter/material.dart';
import 'package:test_assignment/utils/app_constants.dart';

class ExpandableDescription extends StatefulWidget {
  final String description;
  const ExpandableDescription({super.key, required this.description});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _expanded = false;
  static const int _previewLength = 120;

  @override
  Widget build(BuildContext context) {
    final isLong = widget.description.length > _previewLength;
    final preview = isLong
        ? widget.description.substring(0, _previewLength)
        : widget.description;

    return GestureDetector(
      onTap: () {
        if (isLong) setState(() => _expanded = !_expanded);
      },
      child: Text.rich(
        TextSpan(
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textGray,
            height: 1.65,
          ),
          children: [
            TextSpan(
              text: _expanded ? widget.description : '$preview... ',
            ),
            if (isLong)
              TextSpan(
                text: _expanded ? '  Show Less' : 'Read More',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}