use float_eq::assert_float_eq;
fn main() {}

fn find_average(slice: &[f64]) -> f64 {
    if slice.len() == 0 {
        0.0
    } else {
        slice.to_vec().iter().sum::<f64>() / slice.len() as f64
    }
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        let input = [
            17.0, 16.0, 16.0, 16.0, 16.0, 15.0, 17.0, 17.0, 15.0, 5.0, 17.0, 17.0, 16.0,
        ];

        assert_float_eq!(
            find_average(&input),
            200.0 / 13.0,
            abs <= 1e-9,
            r2nd <= 4.0 * f64::EPSILON
        );

        assert_float_eq!(
            find_average(&[]),
            0.0,
            abs <= 1e-9,
            r2nd <= 4.0 * f64::EPSILON
        );
    }
}
