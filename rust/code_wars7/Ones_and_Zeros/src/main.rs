fn main() {
    let foo = "ABC"
        .chars()
        .map(|x| x.to_string())
        .collect::<Vec<String>>()
        .join("");
    println!("{}", foo);
}

// fn binary_slice_to_number(slice: &[u32]) -> u32 {
//     let mut sum = 0u32;
//     for n in 0..slice.len() {
//         sum += slice[n] * 2u32.pow((slice.len() - n - 1) as u32);
//     }
//     sum
// }

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(binary_slice_to_number(&vec![0, 0, 0, 1]), 1);
        assert_eq!(binary_slice_to_number(&vec![0, 0, 1, 0]), 2);
        assert_eq!(binary_slice_to_number(&vec![1, 1, 1, 1]), 15);
        assert_eq!(binary_slice_to_number(&vec![0, 1, 1, 0]), 6);
    }
}
