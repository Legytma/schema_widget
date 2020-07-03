## [0.1.9] - Adding the ability to create fully functional applications using only JSON Schema

* Change google_maps_flutter version from 0.5.25+1 to 0.5.25+3;
* Change flutter spinkit version from 4.1.2 to 4.1.2+1.
* Added RouteHandleMixin, used to navigate using tap events;
* Added RoutedListTile, an ListTile with navigate handle;
* Added IconButton parser;
* Added CircleAvatar parser;
* Added Card parser;
* Added AnimatedContainer parser;
* Added SchemaForm parser;
* Added TextSchemaFormFieldTemplate parser;
* Added TextSchemaFormFieldWidget parser;
* Added tests for new parsers;
* Added NavigationType enum;
* Refactored ColumnShemaWidgetParser;
* Refactored ContaingerSchemaWidgetParser;
* Refactored DrawerHeaderSchemaWidgetParser;
* Refactored ScaffoldSchemaWidgetParser;
* Refactored TextSchemaWidgetParser;
* Refactored SchemaWidget to correct the type of MAP used to enable the addition of the navigation handle dynamically;
* Refactored SchemaWidgetParser to report better logs on invalid schema;
* In the utils.dart file:
 * Refactored parseInt;
 * Refactored parseTooltipTheme;
 * Refactored parseEdgeInsetsGeometry;
 * Refactored parseCrossAxisAlignment;
 * Refactored parseMainAxisAlignment;
 * Refactored parseMainAxisSize;
 * Refactored parseTextBaseline;
 * Refactored parseDouble;
 * Refactored parseClipBehavior to parseClip;
 * Refactored parseTextAlign;
 * Refactored parseTextOverflow;
 * Refactored parseTextDirection;
 * Refactored parseAlignment;
 * Refactored parsePageTransitionsTheme;
 * Refactored parseSliderTheme;
 * Refactored parseToggleButtonsTheme;
 * Refactored parseBorderRadius;
 * Refactored parseDuration;
 * Refactored parseBoxFit;
 * Refactored parseImageRepeat;
 * Refactored parseRect;
 * Refactored parseAxis;
 * Added parseJsonSchema;
 * Added parseFocusNode;
 * Added parsePickerType;
 * Added parseInputDecoration;
 * Added parseFontStyle;
 * Added parseStrutStyle;
 * Added parseToolbarOptions;
 * Added parseTextAlignVertical;
 * Added parseRadius;
 * Added parseImageProvider;
 * Added parseDecoration;
 * Added parseBoxDecoration;
 * Added parseDecorationImage;
 * Added parseColorFilter;
 * Added parseListDouble;
 * Added parseListBoxShadow;
 * Added parseBoxShadow;
 * Added parseOffset;
 * Added parseBoxBorder;
 * Added parseBorderStyle;
 * Added parseBoxShape;
 * Added parseCurve;
 * Added parseDragStartBehavior;
 * Added parseFloatingActionButtonLocation;
 * Added parseFloatingActionButtonAnimator;
 * Added parseNavigationType.

## [0.1.8] - Change register logic to permit override

* Alter implementation of registerLogic to permit alteration of logics registered.

## [0.1.7] - Infer default values on MaterialApps parser properties

* Infer default values in properties added on MaterialApps parser.

## [0.1.6] - Tuning parsers null safe

* Verify for null values during parsers.

## [0.1.5] - Add properties on MaterialApp parser

* Add many properties on MaterialAppSchemaWidgetParser.

## [0.1.4] - Add properties on AppBar parser

* Add many properties on AppBarSchemaWidgetParser.

## [0.1.3] - Better invalid schema log

* More detailed message on schema invalid;
* Change get_it version from 3.1.0 to 4.0.0;
* Change google_maps_flutter version from 0.5.22 to 0.5.24+1;
* Change flutter spinkit version from 4.1.1+1 to 4.1.2.

## [0.1.2] - Add StreamBuilder parser

* Added StreamBuilder parser;
* Change google_maps_flutter version from 0.5.21+17 to 0.5.22.

## [0.1.1] - Change dependency of json_schema

* Change json_schema version from 3.0.0 to 2.2.1.

## [0.1.0] - Refactor.

* Added more widgets;
* Refactor and unify builder method of class SchemaWidget;
* Implement example.

## [0.0.2] - Add more widgets.

* Added more widgets.

## [0.0.1] - Initial commit.

* Added initial widgets from DynamicWidgets.
