//
//  LocalizedStringsMergingFailureTests.m
//  LocalizedStringsMergingFailureTests
//
//  Created by Kamil Jaworski on 8/13/14.
//  Copyright (c) 2014 kajot. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface LocalizedStringsMergingFailureTests : XCTestCase

@end

@implementation LocalizedStringsMergingFailureTests

- (void)testLocalizedStringResolution {

    // On XCode 5.1.1 this test passes every OTHER build :)

    // Found a guy that had the same issue on SO:
    // http://stackoverflow.com/questions/11481348/localizable-strings-failing-to-load-every-other-build

    // A "localization table" is a set of files
    //      <locale_name>.lproj/<table_name>.strings
    //
    // e.g. a table named "Localizable" (the default name) consist of the following files:
    //      en.lproj/Localizable.strings
    //      de.lproj/Localizable.strings
    //      fr.lproj/Localizable.strings

    // Solution to the problem:
    // Have only ONE localization table called "Localizable" (default name for the localization table).
    // In general - do not create more than one table with the same name (even a custom one).

    // In this very project, there are two tables "Localizable". One should rename all the "Localizable.strings"
    // files under the "Localizations2" folder to "AnotherTableName.strings"

    // You can then query for localized strings from the new table by using
    //     NSLocalizedStringFromTable(<#key#>, <#tbl#>, <#comment#>)
    //      tbl - @"AnotherTableName"

    // In general, separating localized strings into separate tables is IMHO a good practice.
    // See how @mattt does this in his FormatterKit:
    // https://github.com/mattt/FormatterKit
    // There is a separate table called "FormatterKit".

    NSString *localizedString = NSLocalizedString(@"testKey1", @"");
    XCTAssert([localizedString isEqualToString:@"testValue1"]); // this will fail every OTHER build :)
    // at least on xcode 5.1.1

}

@end
