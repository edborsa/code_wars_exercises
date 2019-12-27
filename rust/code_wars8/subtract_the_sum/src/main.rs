fn main() {}

fn subtract_sum(n: u32) -> &'static str {
    let mut n_str = n.to_string();
    let mut result = 101;
    let mut sum_digits = 0;

    while result > 100 {
        for i in n_str.chars() {
            sum_digits += i.to_digit(10).unwrap();
        }

        result = n - sum_digits;
        n_str = result.to_string();
    }

    match result {
        1 | 3 | 24 | 26 | 47 | 49 | 68 | 70 | 91 | 93 => "kiwi",
        2 | 21 | 23 | 42 | 44 | 46 | 65 | 67 | 69 | 88 => "pear",
        4 | 6 | 25 | 29 | 48 | 50 | 71 | 73 | 92 | 94 | 96 => "banana",
        5 | 7 | 28 | 30 | 32 | 51 | 53 | 74 | 76 | 95 | 97 => "melon",
        8 | 10 | 12 | 31 | 33 | 52 | 56 | 75 | 77 | 79 | 98 | 100 => "pineapple",
        9 | 18 | 27 | 36 | 45 | 54 | 63 | 72 | 81 | 90 | 99 => "apple",
        11 | 13 | 34 | 55 | 57 | 59 | 78 | 80 => "cucumber",
        14 | 16 | 35 | 37 | 39 | 58 | 60 | 83 => "orange",
        15 | 17 | 19 | 38 | 40 | 61 | 82 | 84 | 86 => "grape",
        _ => "cherry",
    }
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(hello(), "Hello, World!");
    }
}
