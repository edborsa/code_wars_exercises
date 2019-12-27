fn main() {}

fn find_smallest_int(arr: &[i32]) -> i32 {
    *arr.iter().min().unwrap()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(find_smallest_int(&[34, 15, 88, 2]), 2);
        assert_eq!(find_smallest_int(&[34, -345, -1, 100]), -345);
    }
}
