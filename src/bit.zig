const std = @import("std");
const expect = std.testing.expect;
test "k-th bit is set or not" {
    const k = 1;
    const n: u32 = 5;
    const ans = (n >> k) & 1;
    try expect(ans == 0);
}
