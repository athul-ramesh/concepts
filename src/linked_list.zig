const std = @import("std");

const Node = struct {
    value: i32,
    next: ?*Node,
};

fn createLinkedList(allocator: *std.mem.Allocator, arr: []const i32) !?*Node {
    var head: ?*Node = null;
    var current: ?*Node = null;

    for (arr) |value| {
        const newNode = try allocator.create(Node);
        newNode.* = Node{ .value = value, .next = null };

        if (head == null) {
            head = newNode;
            current = newNode;
        } else {
            current.?.*.next = newNode;
            current = newNode;
        }
    }

    return head;
}

test "LinkedList" {
    var allocator = std.heap.page_allocator;

    const arr: [5]i32 = .{ 1, 2, 3, 4, 5 };
    const head = try createLinkedList(&allocator, arr[0..]);

    var current: ?*Node = head;
    while (current != null) : (current = current.?.next) {
        std.debug.print("{} ", .{current.?.value});
    }
    try std.testing.expect(head != null);
}
