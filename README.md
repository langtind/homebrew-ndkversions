homebrew-ndkversions
======================

Usage
-----

To install Android NDK versions form this cask simply tap this repository

```bash
brew tap gocarrot/ndkversions
```

Now you can install any version hosted as cask with

```bash
brew cask install android-ndk@10e
```

The Android NDK will be installed at `/usr/local/Caskroom/android-ndk/$VERSION`. You can install multiple versions at the same time.

A symbolic link to the most recently installed version will be created at `/usr/local/share/android-ndk`

NDK Versions for Unity Versions
-------------------------------

You can also specify installing an NDK version which corrisponds to a version of Unity with

```bash
brew cask install android-ndk-for-unity@2018.1.0f2
```

These versions are based off of Wooga's unityversions cask, located at https://github.com/wooga/homebrew-unityversions

Android NDK Versions available
------------------------------

| Version    | Unity Version |
| ---------: |-------------: |
|        10e | 2017.4.9f1    |
|        13b | 2018.1.0f2    |
|         18 |               |

Currently we only add versions which are used by our automated build & testing. If you'd like a version added, just create an issue on GitHub, and we'll be glad to add it.

License
-------
[MIT License](LICENSE) Copyright (C) 2019 Teak.io, Inc.
