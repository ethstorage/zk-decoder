pragma circom 2.0.6;
include "../node_modules/circomlib/circuits/poseidon.circom";
include "./poly_eval.circom";

// A simple blob encoder using Poseidon hash for each element (2x32 bytes)
// and then mix the data with a polynomial at root of unity
// so that we could batch the calculation using FFT.
// Note that x should be obtained as u^i using big-exp-mod precompile,
// where u is the root of unity.
template blob_poseidon(nelements) {
    signal input encodingKeyIn;
    signal input xIn;                 // x should be a root of unity
    signal output encodingKeyOut;
    signal output xOut;
    signal output yOut;

    signal coeffs[nelements];

    xOut <== xIn;
    encodingKeyOut <== encodingKeyIn;

    component poseidons[nelements / 2];
    for (var i = 0; i < nelements / 2; i++) {
        poseidons[i] = PoseidonEx(2, 3);
        poseidons[i].initialState <== 0;
        poseidons[i].inputs[0] <== encodingKeyIn + i;
        poseidons[i].inputs[1] <== encodingKeyIn + i + 1;
        coeffs[2*i] <== poseidons[i].out[0];
        coeffs[2*i+1] <== poseidons[i].out[1];
    }

    component mixer;
    mixer = poly_eval(nelements);
    mixer.coeffsIn <== coeffs;
    mixer.xIn <== xIn;
    yOut <== mixer.yOut;
}