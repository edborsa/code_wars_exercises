fn main() {}

fn string_to_number(s: &str) -> i32 {
    s.trim().parse::<i32>().unwrap()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(string_to_number("1234"), 1234);
        assert_eq!(string_to_number("605"), 605);
        assert_eq!(string_to_number("1405"), 1405);
        assert_eq!(string_to_number("-7"), -7);
    }
}
