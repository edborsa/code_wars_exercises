fn main() {
}

// fn stones_to_remove(stones: &str) -> usize {
//     stones.chars()
//         .collect::<Vec<_>>()
//         .windows(2)
//         .filter(|x| x[0] == x[1])
//         .count()
// }

fn stones_to_remove(stones: &str) -> usize {
    //first letter
    let mut letter = stones.chars().next().unwrap();
    let mut counter = 0;

    for ch in stones.chars() {
        if ch == letter {
            counter += 1;
        } else {
            letter = ch;
        }
    }
    counter - 1
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(stones_to_remove("RGBRGBRGGB"), 1);
        assert_eq!(stones_to_remove("RGGRGBBRGRR"), 3);
        assert_eq!(stones_to_remove("RRRRGGGGBBBB"), 9);
    }
}
