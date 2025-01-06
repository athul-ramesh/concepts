const std = @import("std");
const FileErrors = error{
    OutOfMemmory,
    FileNotFound,
};
const AllocationError = error{
    OutOfMemmory,
};

test "error types" {
    std.testing.expect(foo(AllocationError.OutOfMemmory) == FileErrors.OutOfMemmory);
}

fn foo(err: AllocationError) FileErrors {
    return err;
}
