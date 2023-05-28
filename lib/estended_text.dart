import 'package:flutter/material.dart';

import 'components/publicationItems.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final Widget? trailing;
  final PublicationItems contentBelow;

  const ExpandableText({
    super.key, 
    required this.text,
    required this.maxLines,
    required this.style,
    this.trailing, 
    required this.contentBelow,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            widget.text,
            style: widget.style,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left
          ),
          secondChild: Text(
            widget.text,
            style: widget.style,
            textAlign: TextAlign.left
          ),
          crossFadeState: isExpanded ? 
            CrossFadeState.showSecond 
            : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 50),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
            child: Text(
              isExpanded ? 'Ver menos' : 'Ver mais',
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ),
        Visibility(
          visible: isExpanded,
          child: widget.contentBelow,
        ),
      ],
    );
  }
}
