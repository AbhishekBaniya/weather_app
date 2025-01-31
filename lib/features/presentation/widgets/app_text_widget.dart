import 'package:flutter/material.dart';

class AppRichTextWidget {
  // Private constructor
  AppRichTextWidget._internal();

  // Singleton instance
  static final AppRichTextWidget _instance = AppRichTextWidget._internal();

  // Factory constructor
  factory AppRichTextWidget() {
    return _instance;
  }

  /// Creates a RichText widget
  RichText buildRichText({
    required String text1,
    TextStyle? style1,
    String? text2,
    TextStyle? style2,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    return RichText(
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      text: TextSpan(
        text: text1,
        style: style1 ?? const TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: text2,
            style: style2 ?? const TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ],
      ),
    );
  }

  /// Creates a RichText widget with multiple parts
  RichText buildComplexRichText({
    required List<TextSpan> textSpans,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    return RichText(
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}
