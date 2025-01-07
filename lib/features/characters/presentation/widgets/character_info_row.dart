import 'package:adhitya/core/theme/app_font.dart';
import 'package:adhitya/core/util/truncate_string.dart';
import 'package:flutter/material.dart';

class CharacterInfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? valueAsWidget;
  const CharacterInfoRow({
    super.key,
    required this.label,
    this.value,
    this.valueAsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Text(
          label,
          style: AppTextStyles.smallNoneRegular,
        ),
      ),
      valueAsWidget ??
          Text(
            value != null || value == '' ? truncateString(value) : "unknown",
            style: AppTextStyles.smallNoneBold,
          ),
    ]);
  }
}
