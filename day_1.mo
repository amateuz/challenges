import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {
    // Challenge 1
    public func add(n: Nat, m: Nat) : async Nat {
        n + m;
    };

    // Challenge 2
    public func square(n: Nat) : async Nat {
        n * n;
    };

    // Challenge 3
    public func days_to_second(n: Nat) : async Nat {
        n * 24 * 60 * 60;
    };

    // Challenge 4
    var counter = 0;
    
    public func increment_counter(n: Nat) : async Nat {
        counter += n;
        counter;
    };

    public func clear_counter() : async Nat {
        counter := 0;
        counter;
    };

    // Challenge 5
    public func divide(n: Nat, m: Nat) : async Bool {
        if (m > 0) {
            n % m == 0;
        }
        else {
            false;
        }
    };

    // Challenge 6
    public func is_even(n: Nat) : async Bool {
        n % 2 == 0;
    };

    // Challenge 7
    public func sum_of_array(arr: [Nat]) : async Nat {
        var sum = 0;
        for (value in arr.vals()) {
            sum += value;
        };
        sum;
    };

    // Challenge 8
    public func maximum(arr: [Nat]) : async Nat {
        var maximum = 0;
        for (value in arr.vals()) {
            if (maximum < value) {
                maximum := value;
            };
        };
        maximum;
    };

    // Challenge 9
    public func remove_from_array(arr: [Nat], n: Nat) : async [Nat] {
        Array.filter(arr, func(m: Nat) : Bool {
            n != m;
        });
    };

    // Challenge 10
    public func selection_sort(arr: [Nat]) : async [Nat] {
        Array.sort(arr, Nat.compare);
    };
}