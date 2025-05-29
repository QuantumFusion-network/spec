## Storage

The QF PolkaVM Smart contract storage design and requirements.

## Features

- Allows to store on chain data using key-value like API.
> Bref:
> Let say Alice runs a smart contract that stored some value by key "K" using storage.set() function;
> then storage key (or real key) is a composite key (contract_address, version, "K"),
> where `caller_adress` is an address of caller (in this context it's address of Alice)
> `contract_address` is an address of smart contract (`docs/PolkaVM/blob_hashing_addressing.md`).
> `version` is a smart contract version.
> For getting or deleting value from the storage the same rule is applied.
>

The references:
(1) https://use.ink/docs/v5/basics/storing-values
(2) https://use.ink/docs/v5/basics/reading-values
(3) https://use.ink/docs/v5/basics/mutating-values

## Proposed API

### Getting a stored value

For getting a non-mutable reference to data.
```
storage.get(K) :: storage.get(Vec<u8>) -> Option<Vec<u8>>,
Where:
- K is a key with type Vec<u8>;
- None means no value found by given key;
- the returned data is not a reference and can't be used for mutating a value.
```

### Set a new value or mutate a stored value

For storing a data by given key.
```
storage.set(K, V) :: storage.set(Vec<u8>,  Vec<u8>) -> bool
Where:
- K is a key with type Vec<u8>;
- returns true, if value is stored, false if not.
```

### Delete stored value by key
For erasing a data by given key.
```
storage.delete(K) :: storage.delete(Vec<u8>) -> bool
Where:
- K is a key with type Vec<u8>;
- returns true, if value is removed or not existed, false if error occured.
```

### Purge storage

#### Option #1: For purge all storated data of the current smart contract in one call.

#### Option #2: For purge all storated data of the current smart contract of the current caller in one call.

```
storage.purge() :: storage.purge() -> u16
Where:
- returns number of purged tuples.
```

### Count elements

#### Option #1: For get number of storated values of the currenct smart contract (i.e. value is a tuple, values are tuples).

#### Option #2: For get number of storated values of the currenct smart contract of the current caller (i.e. value is a tuple, values are tuples).

```
storage.count() :: storage.count() -> u16
Where:
- returns number of stored tuples, 0 if no data stored.
```

### List

#### Option #1: For list storated data of the currenct smart contract. All returned values are non-mutable.

#### Option #2: For list storated data of the currenct smart contract of current caller. All returned values are non-mutable.

```
storage.list(limit, offset) :: storage.list(Option<u16>, Option<u16>) -> Vec<(Vec<u8>, Vec<u8>)>
Where:
- limit max possible elements in K
- offset shift from begining of storated tuples
- returns array of storated tuples, array could be empty, if no data storated.
```

There are 2 options of serialization returned data:

1. SCALE

2. Custom binary serialization a-la "Length-Prefix Encoding" or "TLV":

```
key_size;value_size;number_of_items;key1;value1;...;keyN;valueN
```