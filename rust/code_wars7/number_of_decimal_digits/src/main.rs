fn main() {}

fn digits(n: u64) -> usize {
    n.to_string().len()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(digits(5), 1);
        assert_eq!(digits(12345), 5);
        assert_eq!(digits(9876543210), 10);
    }
}
