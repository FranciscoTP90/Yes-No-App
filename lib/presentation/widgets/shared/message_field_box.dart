// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(50),
    );
    final decoration = InputDecoration(
        filled: true,
        hintText: 'End your message with "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          onPressed: () {
            final txtValue = controller.value.text;
            controller.clear();
            onValue(txtValue);
          },
          icon: const Icon(Icons.send_outlined),
        ));

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: decoration,
      onFieldSubmitted: (value) {
        controller.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      onChanged: (value) {},
    );
  }
}
