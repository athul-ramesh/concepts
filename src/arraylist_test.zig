const std = @import("std");
const expect = std.testing.expect;
const eq = std.mem.eql;

test "arraylist" {
    var arr_list = std.ArrayList(u8).init(std.testing.allocator);
    defer arr_list.deinit();

    try arr_list.append('h');
    try arr_list.append('i');
    try expect(eq(u8, arr_list.items, "hi"));
}
