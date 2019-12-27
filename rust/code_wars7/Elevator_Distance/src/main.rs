fn main() {}

fn elevator_distance(floors: &[i16]) -> i16 {
    floors
        .windows(2)
        .map(|x| (x[0] as i16 - x[1] as i16).abs())
        .sum()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(elevator_distance(&[5, 2, 8]), 9);
        assert_eq!(elevator_distance(&[1, 2, 3]), 2);
        assert_eq!(elevator_distance(&[7, 1, 7, 1]), 18);
    }
}
