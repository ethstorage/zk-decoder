pragma circom 2.0.6;
include "./blob_poseidon_lib.circom";

// 4096 * 32 = 128KB BLOB size
component main = blob_poseidon(4096);