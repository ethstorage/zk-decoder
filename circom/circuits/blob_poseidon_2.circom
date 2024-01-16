pragma circom 2.0.6;
include "./blob_poseidon_lib.circom";

template blob_poseidon_n(nelements, n) {
    signal input encodingKeyIn[n];
    signal input xIn[n];                 // x should be a root of unity
    signal output encodingKeyOut[n];
    signal output xOut[n];
    signal output yOut[n];

    component blob_poseidons[n];
    for (var i = 0; i < n; i++) {

        blob_poseidons[i] = blob_poseidon(nelements);
        blob_poseidons[i].encodingKeyIn <== encodingKeyIn[i];
        blob_poseidons[i].xIn <== xIn[i];

        encodingKeyOut[i] <== blob_poseidons[i].encodingKeyOut;
        xOut[i] <== blob_poseidons[i].xOut;
        yOut[i] <== blob_poseidons[i].yOut;
    }
}


// 4096 * 32 = 128KB BLOB size
component main = blob_poseidon_n(4096, 2);