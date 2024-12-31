//! this is a top level doc comment
//! which should be placed at the top level as the name suggests.
const std = @import("std");
const print = std.debug.print;
///this is a doc comment for main method.
///doc comments can be multiline.
// zig treats interleaved noraml comments as doc comment
/// this will be treated as a block comment
pub fn main() !void {
    // zig does not have a seperarte multi line comment

    //Values
    const added_value: i32 = 1 + 1;
    print("1+1 = {}\n", .{added_value});

    const added_value_float: f16 = 1.1 + 1.1;
    print("1.1+1.1 = {}\n", .{added_value_float});

    // optional
    var optional_value: ?[]const u8 = null;
    print("optional {?s}\n", .{optional_value});
    optional_value = "Hi";
    print("Optional after assignment {?s} and its type is {}\n", .{ optional_value, @TypeOf(optional_value) });
    // bool
    const a = true;
    const b = false;
    print("{}\n{}\n", .{ a and b, a or b });

    // primitive types
    // have bunch of int and float types
    // even have bunch of types with prefix "c_" for ABI compatibility.
    // ABI (Application binary interface) means seperate compiled binaries can communicate with each other.
    // zig also provides arbitary bit width integers that can be referenced by "i" or "u" followed by bit width.
}
