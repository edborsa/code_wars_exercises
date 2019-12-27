fn dna_to_rna(dna: &str) -> String {
    dna.chars().map(char_conversion).collect()
}

fn char_conversion(c: char) -> char {
    if c == 'T' {
        return 'U';
    }

    c
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn it_works() {
        assert_eq!(dna_to_rna("TTTT"), "UUUU");
        assert_eq!(dna_to_rna("GCAT"), "GCAU");
    }
}
