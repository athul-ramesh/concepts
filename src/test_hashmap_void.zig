const std = @import("std");
const expect = std.testing.expect;

test "void in hashmap" {
    var hashmap = std.AutoHashMap(i32, void).init(std.testing.allocator);
    defer hashmap.deinit();
    try hashmap.put(1, {});
    try expect(hashmap.contains(1));
    _ = hashmap.remove(1);
    try expect(!hashmap.contains(1));
}
