const std = @import("std");
const expect = std.testing.expect;

test "page allocatore" {
    const allocator = std.heap.page_allocator;
    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);

    try expect(memory.len == 100);
}

test "fixed buffer allocator" {
    var buffer: [100]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);
    try expect(memory.len == 100);
}

test "arena allocator" {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const mem1 = try allocator.alloc(u8, 10);
    try expect(mem1.len == 10);
    const mem2 = try allocator.alloc(u8, 20);
    try expect(mem2.len == 20);
}

test "general purpose allocotor" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const code = gpa.deinit();
        if (code == .leak) expect(false) catch @panic("TEST FAIL");
    }

    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);

    try expect(memory.len == 100);
}
