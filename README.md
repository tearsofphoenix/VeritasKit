VeritasKit
==========

Lua wrapper for Objective-C, implemented most Objective-C features


TODOs

1. memory management, gc of lua;
2. support for `@property', it has been implemented, but not tested yet;
3. support for class-ivar, you can not access to ivar by name (for example, _ivarName) in 
   method block
4. full support of block, block is almost fully supported excepted some wired condition

Features

1. support most Objective-C syntax features, which is simillar to Objective-C progammers(such as @autoreleasepool);
2. support lua syntax, so we may call this Objective-Lua;
3. support new Objective-C syntax, such as literal NSDictionary, literal NSArray, literal NSNumber,
   syntax of literal NSDictionary is not the same as in Objective-C, consider the lua syntax;
4. support enumerate syntax of collections (the for-in syntax);
5. add some extensions, such as @array, @dictionary, @table to convert value between Objective-C and lua;

Known Bugs

1. memory can not be collected yet;
2. no try-catch-final, @throw implemented, but not that good, recommanded not to use this feature;
3. will not support dot-operator (.) on instance, which is my decision;

What we know

1. I have used this framework in one of my comercial project, it works well