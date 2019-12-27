fn main() {}

fn peak(arr: &[u32]) -> Option<usize> {
    for i in 0..arr.len() {
        if arr[0..i].iter().sum::<u32>() == arr[i + 1..].iter().sum() {
            return Some(i);
        }
    }
    None
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(peak(&vec![1, 2, 3, 5, 3, 2, 1]), Some(3));
        assert_eq!(peak(&vec![1, 12, 3, 3, 6, 3, 1]), Some(2));
        assert_eq!(peak(&vec![10, 20, 30, 40]), None);
    }
}
