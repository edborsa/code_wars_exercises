import { MORSE_CODE } from "./preloaded";

export const trimZeroes = (bits: string) => bits.replace(/^0+|0+$/g, "");

export const decodeBits = (bits: string) => {
  bits = trimZeroes(bits);

  const scale = Math.min(...bits.match(/1+|0+/g)!.map((el) => el.length));
  return bits
    .replace(new RegExp("111".repeat(scale), "gi"), "-")
    .replace(new RegExp("1".repeat(scale), "gi"), ".")
    .replace(new RegExp("0000000".repeat(scale), "gi"), "   ")
    .replace(new RegExp("000".repeat(scale), "gi"), " ")
    .replace(new RegExp("0".repeat(scale), "gi"), "");
};

export const decodeMorse = (morseCode: string) =>
  morseCode
    .trim()
    .split("   ")
    .map((word) =>
      word
        .split(" ")
        .map((letter) => MORSE_CODE[letter])
        .join("")
    )
    .join(" ");
