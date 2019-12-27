fn main() {}

fn even_numbers(xs: &Vec<i32>, n: usize) -> Vec<i32> {
    let mut res: Vec<i32> = xs
        .iter()
        .rev()
        .cloned()
        .filter(|x| x % 2 == 0)
        .take(n)
        .collect::<Vec<i32>>();
    res.reverse();
    res
}

fn even_numbers(array: &Vec<i32>, number: usize) -> Vec<i32> {
    array
        .iter()
        .rev()
        .filter(|n| n.checked_rem(2) == Some(0))
        .take(number)        
        .cloned()
        .collect::<Vec<i32>>()
        .into_iter()
        .rev()
        .collect()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(
            even_numbers(&vec!(1, 2, 3, 4, 5, 6, 7, 8, 9), 3),
            vec!(4, 6, 8)
        );
        assert_eq!(
            even_numbers(&vec!(-22, 5, 3, 11, 26, -6, -7, -8, -9, -8, 26), 2),
            vec!(-8, 26)
        );
        assert_eq!(
            even_numbers(&vec!(6, -25, 3, 7, 5, 5, 7, -3, 23), 1),
            vec!(6)
        );
    }
}
