pragma circom 2.0.6;
include "../node_modules/circomlib/circuits/poseidon.circom";

template poly_eval(n) {
    signal input coeffs[n];
    signal input x;
    signal xn[n];
    signal sum[n];
    signal output y;
    xn[0] <== 1;
    sum[0] <== coeffs[0];
    for (var i = 1; i < n; i++) {
        xn[i] <== xn[i-1] * x;
        sum[i] <== xn[i] * coeffs[i] + sum[i-1];
    }
    y <== sum[n-1];
}

