# text_to_speech_platform_interface

A common platform interface for the [`text_to_speech`][1] plugin.

This interface allows platform-specific implementations of the `text_to_speech`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `text_to_speech`, extend
[`TextToSpeechPlatform`][2] with an implementation that performs the
platform-specific behavior, and when you register your plugin, set the default
`TextToSpeechPlatform` by calling
`TextToSpeechPlatform.instance = MyPlatformTextToSpeechLauncher()`.

# Note on breaking changes

Strongly prefer non-breaking changes (such as adding a method to the interface)
over breaking changes for this package.

See https://flutter.dev/go/platform-interface-breaking-changes for a discussion
on why a less-clean interface is preferable to a breaking change.

[1]: https://github.com/ixsans/text_to_speech
[2]: https://github.com/ixsans/text_to_speech_platform_interface/blob/main/lib/text_to_speech_platform.dart