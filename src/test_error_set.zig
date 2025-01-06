const std = @import("std");
const FileErrors = error{
    OutOfMemmory,
    FileNotFound,
};
const AllocationError = error{
    OutOfMemmory,
};

test "error types" {
    const err = foo(AllocationError.OutOfMemmory);
    try std.testing.expect(err == FileErrors.OutOfMemmory);
}

fn foo(err: AllocationError) FileErrors {
    return err;
}
