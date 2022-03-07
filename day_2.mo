import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

actor {
    // Challenge 1
    public func nat_to_nat8(n: Nat) : async Nat8 {
        var result: Nat8 = 255;

        if (n < 255) {
            result := Nat8.fromNat(n);
        };
        result;
    };

    // Challenge 2
    public func max_number_with_n_bits(n: Nat) : async Nat {
        2**n - 1;
    };

    // Challenge 3
    public func decimal_to_bits(n: Nat) : async Text {
        var iter = n;
        var result = "";
        loop {
            result := Nat.toText(iter % 2) # result;
            iter := iter / 2;
        } while (iter > 1);
        result := Nat.toText(iter) # result;
        result;
    };

    // Challenge 4
    public func capitalize_character(c: Char) : async Char {
        var result = c;
        let charCode = Char.toNat32(c);
        if (charCode > 96 and charCode < 123) {
            result := Char.fromNat32(charCode - 32);
        };
        result;
    };

    // Challenge 5
    public func capitalize_text(t: Text) : async Text {
        var result = "";
        for (c in t.chars()) {
            result := result # Char.toText(await capitalize_character(c));
        };
        result;
    };

    // Challenge 6
    public func is_inside(t: Text, c: Char) : async Bool {
        // let contains: Bool = Text.contains(t, #char(c)); <-- easy way
        var result = false;
        for (char in t.chars()) {
            if (char == c) {
                result := true;
            };
        };
        result;
    };

    // Challenge 7
    public func trim_whitespace(t: Text) : async Text {
        Text.trim(t, #text(" "));
    };

    // Challenge 8
    public func duplicated_character(t: Text) : async Text {
        var result = t;
        var chars = Buffer.Buffer<Char>(0);

        for (char in t.chars()) {
            for (bufferedChar in chars.vals()) {
                if (bufferedChar == char) {
                    return Char.toText(char);
                };
            };
            chars.add(char);
        };

        result;
    };

    // Challenge 9
    public func size_in_bytes(t: Text) : async Nat {
        Text.encodeUtf8(t).size();
    };

    // Challenge 10
    public func bubble_sort(arr: [Nat]) : async [Nat] {
        if (arr.size() < 2) return arr;

        var sortedArr = Array.thaw<Nat>(arr);
        var iterations = 0;

        while (iterations < arr.size()) {
            var i = 0; var j = 1;
            // no trap
            while (j < arr.size() - iterations) {
                switch (Nat.compare(sortedArr[i], sortedArr[j])) {
                    case (#greater) {
                        let swap = sortedArr[i];
                        sortedArr[i] := sortedArr[j];
                        sortedArr[j] := swap;
                    };
                    case (#less) {}; // to disable linter warning
                    case (#equal) {}; // to disable linter warning
                };
                i += 1;
                j += 1;
            };
            iterations += 1;
        };
        Array.freeze(sortedArr);
    };
};