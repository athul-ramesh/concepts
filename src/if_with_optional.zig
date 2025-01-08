const std = @import("std");
const expect = std.testing.expect;

test "if with optional" {
    const a: ?u8 = 1;
    if (a) |val| {
        try expect(val == 1);
    }
}
