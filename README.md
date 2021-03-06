# flutter_kitchensink

A flutter kitchensink by Yee Siang.

## Getting Started with new project

1. Create a github repo. Take note the name must comply to flutter package naming convention and do not allow '-' in it. Do not create the READEME.md startup file yet.

2. Clone the repo to local at path `~/studio/flutter_kitchensink`

3. Create flutter app with command 
```
cd ~/studio
flutter create flutter_kitchensink
```

4. Open the project in vscode with following pre-installed extension:
- flutter
- awesome flutter snippet
- flutter riverpod snippet

5. Open the IOS/Android simulator, I recommend using iphone 13 on Mac (I assume xcode is already setup). Once ready, you can see "iPhone 13 (ios simulator)" shows at the bottom right of vscode status bar.

6. At its terminal, run the skeleton app using `flutter run`.

7. If everything works, you can see the flutter counter demo app running in your simulator.

### Session
Session store data into local permenant storage (sharedPref or file system thru `getApplicationDocumentsDirectory()`).

Thus created an effect of session or permanent stateful stage when switch between screen or even reopen the app.

However, they are to be use together with flutter Stateful Widget or even Riverpod for the missing reactive part.

### Riverpod
This is definitely a better replacement to the default flutter `setState()` and stateful widget.

Follows: https://riverpod.dev/docs/getting_started

```dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
final counterProvider = Provider((_) => 0);

void main() {
    runApp(
        // For widgets to be able to read providers, we need to wrap the entire
        // application in a "ProviderScope" widget.
        // This is where the state of our providers will be stored.
        ProviderScope(
            child: MyApp(),
        ),
    );
}

class MyApp extends HookConsumerWidget {
    Widget build(BuildContext context, WidgetRef ref) {
        final String value = ref.watch(helloWorldProvider);
        ...
    }
}
```

## Freezed, Build Runner
This show how app can call RESTful Api to acquire data and work with riverpod.

Follows: https://medium.com/@surajadkhari/using-riverpod-future-provider-to-fetch-api-7706cad3718e


`flutter pub run build_runner build --delete-conflicting-outputs`

