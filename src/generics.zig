const std = @import("std");
const expcept = std.testing.expect;

fn min(comptime T: type, a: T, b: T) T {
    return if (a < b) a else b;
}
test "Generics" {
    try expcept(min(u8, 1, 2) == 1);
    try expcept(min(i16, -16, -18) == -18);
}
