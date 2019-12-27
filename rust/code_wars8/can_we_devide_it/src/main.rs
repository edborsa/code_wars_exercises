fn main() {}

fn is_divide_by(number: i32, a: i32, b: i32) -> bool {
    number % a == 0 && number % b == 0
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(is_divide_by(8, 2, 4), true);
        assert_eq!(is_divide_by(12, -3, 4), true);
        assert_eq!(is_divide_by(8, 3, 4), false);
        assert_eq!(is_divide_by(48, 2, -5), false);
        assert_eq!(is_divide_by(-100, -25, 10), true);
        assert_eq!(is_divide_by(10000, 5, -3), false);
        assert_eq!(is_divide_by(4, 4, 2), true);
        assert_eq!(is_divide_by(5, 2, 3), false);
        assert_eq!(is_divide_by(-96, 25, 17), false);
        assert_eq!(is_divide_by(33, 1, 33), true);
    }
}
