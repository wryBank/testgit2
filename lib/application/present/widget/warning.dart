import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String content;
  final String? subContent;
  final Function()? onEnter;
  final double borderRadius;

  const WarningDialog({
    super.key,
    required this.content,
    this.subContent,
    this.onEnter,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: SizedBox(
        // maxWidth: 500,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 15),
              if (subContent != null) ...[
                Text(
                  subContent ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
              const SizedBox(height: 35),
              ElevatedButton(
                  onPressed: () {
                    if (onEnter != null) {
                      onEnter!();
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK")),
            ],
          ),
        ),
      ),
    );
  }
}
