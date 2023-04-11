pragma circom 2.0.6;
include "../node_modules/circomlib/circuits/poseidon.circom";

template poly_eval(n) {
    signal input coeffsIn[n];
    signal input xIn;
    signal xn[n];
    signal sum[n];
    signal output yOut;
    xn[0] <== 1;
    sum[0] <== coeffsIn[0];
    for (var i = 1; i < n; i++) {
        xn[i] <== xn[i-1] * xIn;
        sum[i] <== xn[i] * coeffsIn[i] + sum[i-1];
    }
    yOut <== sum[n-1];
}

