fn main() {}

fn shared_bits(a: u32, b: u32) -> bool {
    let mut a = a;
    let mut b = b;
    let mut vecA: Vec<u32> = Vec::new();
    let mut vecB: Vec<u32> = Vec::new();
    let mut vecResponse: Vec<u32> = Vec::new();
    while a > 1 {
        vecA.push(a % 2);
        a = a / 2;
        println!("a: {:?}", a);
    }
    vecA.push(a % 2 as u32);

    println!("VecA: {:?}", vecA);

    while b > 1 {
        vecB.push(b % 2);
        b = b / 2;
    }
    vecB.push(b % 2 as u32);

    println!("VecB: {:?}", vecB);

    vecA = vecA.iter().copied().rev().collect();
    let foo: Vec<u32> = vecB.iter().copied().rev().collect();
    let min = vecA.len().min(vecB.len());
    println!("{}", min);
    for i in 0..(min - 1) {
        println!("i: {} ", i);
        println!("{} == 1: {}", vecA[i], vecA[i] == 1);
        println!("{} == {}: {}", vecA[i], vecB[i], vecA[i] == vecB[i]);
        println!("foo[2]: {} ", foo[2]);
        if vecA[i] == 1 && vecA[i] == vecB[i] {
            println!("@@@@ CAIU AQUI @@@@@@@@@@@");
            vecResponse.push(1);
        }
    }
    println!("VecResponse: {:?}", vecResponse);
    println!("Response: {}", vecResponse.iter().sum::<u32>() >= 2);
    println!("@@@@@@@@@@@@@@@");
    vecResponse.iter().sum::<u32>() >= 2
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        // assert!(!shared_bits(1, 2), "Expected shared_bits(1, 2) to be false");
        // assert!(
        //     !shared_bits(16, 8),
        //     "Expected shared_bits(16, 8) to be false"
        // );
        // assert!(!shared_bits(1, 1), "Expected shared_bits(1, 1) to be false");
        assert!(!shared_bits(2, 3), "Expected shared_bits(2, 3) to be false");
        assert!(
            !shared_bits(7, 10),
            "Expected shared_bits(7, 10) to be false"
        );
        // assert!(
        //     shared_bits(43, 77),
        //     "Expected shared_bits(43, 77) to be true"
        // );
        // assert!(shared_bits(7, 15), "Expected shared_bits(7, 15) to be true");
        // assert!(shared_bits(23, 7), "Expected shared_bits(23, 7) to be true");
    }
}
