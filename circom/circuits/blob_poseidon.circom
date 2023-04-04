pragma circom 2.0.6;
include "../node_modules/circomlib/circuits/poseidon.circom";
include "./poly_eval.circom";

// A simple blob encoder using Poseidon hash for each element (32 bytes)
// and then mix the data with a polynomial at root of unity
// so that we could batch the calculation using FFT.
// Note that x should be obtained as u^i using big-exp-mod precompile,
// where u is the root of unity.
template blob_poseidon(nelements) {
    signal input encoding_key;
    signal input x;                 // x should be a root of unity

    signal coeffs[nelements];

    component poseidons[nelements];
    for (var i = 0; i < nelements; i++) {
        poseidons[i] = Poseidon(1);
        poseidons[i].inputs[0] <== encoding_key + i;
        coeffs[i] <== poseidons[i].out;
    }

    component mixer;
    mixer = poly_eval(nelements);
    mixer.coeffs <== coeffs;
    mixer.x <== x;
}


// 4096 * 32 = 128KB BLOB size
component main = blob_poseidon(4096);