KSP prune tool
===

This tool scans through directories listed in the code and renames all *.cfg files to *.cfg.__disabled__

How to use?
---

1) You need Dart installed, anything 2.0.0+ should do.

2) examione dirs.dart for folders that will be disabled, edit the `dirs` list if needed.

3) run `disable.dart` script inside `script` folder

4) examine all `cfg` files in listed folders has been renamed

How to revert?

1) run `restore.dart` script inside `script` folder


