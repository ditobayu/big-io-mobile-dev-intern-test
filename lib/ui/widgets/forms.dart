import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputForms extends StatefulWidget {
  final String label;
  final Icon icon;
  final String hintText;
  final double height;
  final bool isObscure;
  final TextInputType inputType;
  final Function(String query) onChange;

  const CustomInputForms({
    super.key,
    required this.label,
    required this.icon,
    required this.hintText,
    this.height = 46,
    this.inputType = TextInputType.text,
    this.isObscure = false,
    required this.onChange,
  });

  @override
  _CustomInputFormsState createState() => _CustomInputFormsState();
}

class _CustomInputFormsState extends State<CustomInputForms> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.label,
        style: AppTextStyles.smallNoneBold,
      ),
      const SizedBox(height: 4),
      Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary300),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: widget.icon,
            ),
            Expanded(
              child: TextFormField(
                onChanged: widget.onChange,
                obscureText: _isObscure,
                keyboardType: widget.inputType,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  suffixIcon: widget.isObscure
                      ? IconButton(
                          icon: SvgPicture.asset(
                            _isObscure
                                ? 'assets/icons/ic_eye_off.svg'
                                : 'assets/icons/ic_eye.svg',
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
