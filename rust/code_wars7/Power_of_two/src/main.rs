fn main() {}

fn power_of_two(x: u64) -> bool {
    let mut answer = false;
    let mut base = 0;
    loop {
        if 2_u64.pow(base) < x {
            base += 1;
        } else if 2_u64.pow(base) == x {
            return true;
        } else if 2_u64.pow(base) > x {
            return false;
        }
    }
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(power_of_two(0), false);
        assert_eq!(power_of_two(2), true);
        assert_eq!(power_of_two(5), false);
        assert_eq!(power_of_two(6), false);
        assert_eq!(power_of_two(8), true);
        assert_eq!(power_of_two(1024), true);
        assert_eq!(power_of_two(4096), true);
        assert_eq!(power_of_two(8191), false);
    }
}
