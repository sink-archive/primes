const std = @import("std");

const n = 4_294_967_295;
var sieveValues: [n]bool = undefined;

pub fn main() anyerror!void {
    var i: u64 = 2;

    while ((i * i) < n) {
        if (!sieveValues[i]) {
            var j: u64 = 0;
            while (((i * i) + (j * i)) < n) {
                var k = (i * i) + (j * i);
                sieveValues[k] = true;
                j += 1;
            }
        }

        i += 1;
    }

    for (sieveValues) |item, index| {
        if (!item and index >= 2) {
            std.debug.print("{d}\n", .{index});
        }
    }
}