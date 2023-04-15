# zk-decoder

## Generate the Circuit

`npm run build blob_poseidon`

## Generate the Proof
Update `input/input_blob_poseidon.json` and then

`npm run prove blob_poseidon`

## Generate the Solidity Verifier

Under `circom/build` folder and run

`snarkjs zkey export solidityverifier blob_poseidon.zkey verifier.sol`

## Generate Calldata

Under `circom/build` folder and run

`snarkjs generatecall public_blob_poseidon.json proof_blob_poseidon.json`