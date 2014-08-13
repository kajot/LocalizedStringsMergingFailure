If you have two LocalizedString tables with the same name, XCode (at least in version 5.1.1) will produce a corrupted localized.strings file in the bundle *EVERY OTHER BUILD*.

Check out a test that passes every other build (at least XCode 5.1.1):
https://github.com/kajot/LocalizedStringsMergingFailure/blob/master/LocalizedStringsMergingFailureTests/LocalizedStringsMergingFailureTests.m

I've found SO topic with that issue, created eons ago:
http://stackoverflow.com/questions/11481348/localizable-strings-failing-to-load-every-other-build

Solution to that problem is described in the aforemenetioned test file (https://github.com/kajot/LocalizedStringsMergingFailure/blob/master/LocalizedStringsMergingFailureTests/LocalizedStringsMergingFailureTests.m
)
