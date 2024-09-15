
**StreakWidget** is a Flutter widget for displaying a grid of days with target achievements. It allows you to visualize streaks or goals with customizable colors and tap handling.

## Features

- Display a grid of days with customizable colors.
- Support for tap interactions to handle user input.
- Flexible styling options for borders, colors, and layout.
## Preview
<img src="https://github.com/h65wang/flutter-animated-counter/raw/main/assets/showcase.gif" height="80">

## Usage

Add `streak_widget` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  streak_widget: ^0.0.1
```
Import the package in your Dart file:

```
import 'package:streak_widget/streak_widget.dart';
```
```dart
 StreakWidget(
              numberOfDays: 20,
              crossAxisCount: 4,
              margin: const EdgeInsets.all(40),
              isDayTargetReachedMap: Map.fromEntries(
                List.generate(
                  numberOfDays,
                  (index) => MapEntry(
                    index,
                    index % 2 == 0 || index % 3 == 0 || index % 5 == 0,
                  ),
                ),
              ),
              height: 100,
              width: 350,
              onTap: (index) {
               /// perform on square tapped
              },
            ),
```
This table outlines each attribute of the `StreakWidget` along with its type, default value, and a brief description of what it does.
| Attribute               | Type                                  | Default                         | Description                                                                                  |
|-------------------------|---------------------------------------|---------------------------------|----------------------------------------------------------------------------------------------|
| `numberOfDays`           | `int`                                 | Required                        | The total number of days to display in the grid.                                              |
| `isDayTargetReachedMap`  | `Map<int, bool>`                      | Required                        | A map where the key is the day index, and the value is whether the target for that day is reached (`true` for reached, `false` for not). |
| `emptyColor`             | `Color`                               | `Colors.grey`                   | The background color for days where the target is not reached.                                |
| `filledColor`            | `Color`                               | `Colors.green`                  | The background color for days where the target is reached.                                    |
| `height`                 | `double`                              | `100`                           | The height of the widget container.                                                           |
| `width`                  | `double`                              | `400`                           | The width of the widget container.                                                            |
| `onTap`                  | `void Function(int index)?`           | `null`                          | A callback function triggered when a day is tapped. The index of the day is passed as an argument. |
| `crossAxisCount`         | `int`                                 | `7`                             | The number of columns in the grid (i.e., how many items per row).                             |
| `margin`                 | `EdgeInsetsGeometry`                  | `EdgeInsets.all(10)`            | The margin around the entire widget.                                                          |
| `padding`                | `EdgeInsetsGeometry`                  | `EdgeInsets.all(10)`            | The padding inside the widget container, around the content.                                  |
| `borderRadius`           | `BorderRadius`                        | `BorderRadius.circular(8)`       | The border radius for rounding the corners of the widget container.                           |
| `borderColor`            | `Color?`                              | `Colors.grey.withOpacity(0.4)`  | The color of the border around the widget. If `null`, a semi-transparent grey is used.        |
| `borderWidth`            | `double`                              | `1`                             | The thickness of the border around the widget.                                                |
| `scrollDirection`        | `Axis`                                | `Axis.horizontal`               | The direction in which the grid can be scrolled (`horizontal` or `vertical`).                 |
| `scrollPhysics`          | `ScrollPhysics`                       | `BouncingScrollPhysics()`       | The physics for scrolling behavior, such as bounce, inertia, etc.                             |
| `mainAxisSpacing`        | `double`                              | `2`                             | The vertical spacing between items in the grid.                                               |
| `crossAxisSpacing`       | `double`                              | `2`                             | The horizontal spacing between items in the grid.                                             
