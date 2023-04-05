# Test poseidon python vs circom
import poseidon

# Test vector for 254 bits
# sage poseidonperm_x5_254_3.sage
output_254 = [0x115cc0f5e7d690413df64c6b9662e9cf2a3617f2743245519e19607a4417189a, 0x0fca49b798923ab0239de1c9e7a4a9a2210312b6a2f616d18b5a87f9b628ae29, 0x0e7ae82e40091e63cbd4f16a6d16310b3729d4b6e138fcf54110e2867045a30c]

t ,full_round, partial_round, alpha, prime, input_rate, security_level, rcl, mds, output = 3, 8, 57, 5, poseidon.prime_254, 2, 128, poseidon.round_constants_254, poseidon.matrix_254, output_254
instance = poseidon.FastPoseidon(prime, security_level, alpha, input_rate, t=t, full_round=full_round,
                                 partial_round=partial_round, rc_list=rcl, mds_matrix=mds)

# BN128 curve order
assert poseidon.prime_254 == 21888242871839275222246405745257275088548364400416034343698204186575808495617

input_vec = [x for x in range(0, t)]
assert instance.run_hash_state(input_vec) == output_254
print("Test passed")
