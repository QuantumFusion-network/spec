# PolkaVM Blob Hashing and Addressing

This document describes how hashing and addressing work for PolkaVM blobs. These changes were necessary to provide access to blobs for other users. Previously, only the user who uploaded a blob could execute it.

## Description

PolkaVM blobs, representing compiled programs, are stored on-chain. To manage these blobs effectively and enable their execution by any user, a hashing and addressing scheme is employed. Each uploaded blob is assigned a unique address based on its content and a version number. This ensures immutability, prevents collisions, and allows multiple versions of a blob to coexist. Note that currently, only the latest version of a blob is accessible for execution; older versions are superseded and not directly retrievable.

## How Hash and Address are Set for an Uploaded PVM Blob

1. **`BlobMetadata` Generation:** Upon uploading a new PolkaVM blob, a `BlobMetadata` struct is created or updated. This metadata includes:
    - `owner`: The account ID of the user who uploaded the blob.
    - `version`: A monotonically increasing version number for blobs uploaded by the same owner. This ensures unique addresses even when the same code is re-uploaded.

2. **Hash Calculation:** The hash of the `BlobMetadata` struct (which includes the owner and version) is computed using `T::Hashing::hash_of`, which in this pallet is [BLAKE2-256](https://en.wikipedia.org/wiki/BLAKE_(hash_function)#BLAKE2). This hash serves as the address of the PolkaVM blob. Because the version is part of the metadata, different versions of a blob will result in different addresses, even if the blob's code is exactly the same.

3. **Storage:** The PolkaVM blob's bytecode (`raw_blob`) is stored in the `Code` storage map, keyed by the calculated hash (address). The `BlobMetadata` is also stored, keyed by the owner's account ID. This allows tracking of the latest version. Execution results are stored separately in the `CalculationResult` storage map, keyed by a tuple of the code address and the executor's account ID.


## How the Address is Used in Transactions

The PolkaVM blob's address (the hash of the `BlobMetadata`) is used in the following ways:

1. **`upload`:** After the blob is uploaded and the address is generated, the `ProgramBlobUploaded` event emits the address, along with the owner and exported functions. This informs users about the successful upload and provides the address for future use.

2. **`execute`:** The `execute` call requires the `blob_address` as an argument. This address is used to retrieve the corresponding PolkaVM bytecode from the `Code` storage using `Code::<T>::get(blob_address)`.


## Example

Let's say Alice uploads a PolkaVM blob. Her account ID is `Alice`.

1. Initially, Alice's `CodeMetadata` is empty.
2. Upon uploading, a new `BlobMetadata` is created with `owner = Alice` and `version = 1`.
3. The hash of this metadata, `H(Alice, 1)`, becomes the blob's address.
4. The blob's bytecode is stored under `Code[H(Alice, 1)]`.
5. The `BlobMetadata` is stored under `CodeMetadata[Alice]`.

Later, if Alice uploads a new version:

1. The old bytecode at `Code[H(Alice, 1)]` is removed.
2. A new `BlobMetadata` is created with `owner = Alice` and `version = 2`.
3. The new address `H(Alice, 2)` is calculated.
4. The new bytecode is stored under `Code[H(Alice, 2)]`.
5. The updated `BlobMetadata` is stored under `CodeMetadata[Alice]`.  (Note: the previous `CodeMetadata` is overwritten)

If Bob wants to execute Alice's latest code:

1. Bob needs to obtain the latest address (e.g. `H(Alice, 2)`).
2. Bob provides the address `H(Alice, 2)` in the `execute` transaction.
3. The runtime retrieves the bytecode from `Code[H(Alice, 2)]`.
4. After execution, the result is stored in `CalculationResult[(H(Alice, 2), Bob)]`, associating the result with both the code and Bob's account.
