fn main() {
    println!("{:?}", first_num(2));
    println!("{:?}", row_sum_odd_numbers(2));
}

fn first_num(n: i64) -> i64 {
    let mut base = 1;
    let base_n = n - 1;
    for i in 1..=base_n {
        base += 2 * i;
    }
    base.into()
}

fn row_sum_odd_numbers(n: i64) -> i64 {
    let first_num = first_num(n);

    let mut answer = 0;
    for i in 0..(n) {
        answer += first_num + 2 * i;
    }
    answer
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(row_sum_odd_numbers(1), 1);
        assert_eq!(row_sum_odd_numbers(42), 74088);
    }
}
