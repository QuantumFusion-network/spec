## Storage

The QF PolkaVM Smart contract storage design and requirements.

## Features

- Allows to store on chain data using key-value like API.
> Bref:
> Let say Alice runs a smart contract that stored value = 1 by key "K" using storage.set() function;
> then storage key (or real key) = contract_address.str() + "K",
> where `caller_adress` is an address of caller (in this context it's address of Alice)
> `contract_address` is an address of smart contract (`docs/PolkaVM/blob_hashing_addressing.md`).
> For getting value from the storage the same rule is applied.
>
- Supports encode/decode complex sturctures [not in the first implmentation]: bool, u{8,16,32,64,128}, i{8,16,32,64,128}, String, tuples, and arrays.

The references:
(1) https://use.ink/docs/v5/basics/storing-values
(2) https://use.ink/docs/v5/basics/reading-values
(3) https://use.ink/docs/v5/basics/mutating-values

## Proposed API

### Getting a stored value

For getting a non-mutable reference to data.
```
storage.get(X) :: get(String) -> Option<bool | u{8,16,32,64,128} | i{8,16,32,64,128} | String | tuple | array>,
Where:
- X is a key with type String;
- If K = None means no value found by given key;
- the returned data is not a reference and can't be used for mutating a value.
```

### Set a new value or mutate a stored value

For storing a data by given key.
```
storage.set(X, V) :: set(String,  bool | u{8,16,32,64,128} | i{8,16,32,64,128} | String | tuple | array) -> bool
Where:
- X is a key with type String;
- returns true, if value is stored, false if not.
```

### Delete stored value by key
For erasing a data by given key.
```
storage.delete(X) = K -> bool
Where:
- X is a key with type String;
- returns true, if value is removed or not existed, false if error occured.
```

### Purge storage

For purge all callers' storated data in one call.
```
storage.purge() = K -> u16
Where:
- returns number of purged tuples.
```
### Count elements
For get number of storated values (i.e. value is a tuple, values are tuples).
```
storage.count() = K -> u16
Where:
- returns number of stored tuples, 0 if no data stored.
```

### List
For list all callers' storated data. All returned values are non-mutable.
```
storage.list([limit, offset]) = K -> array(tuples)
Where:
- limit max possible elements in K
- offset shift from begining of storated tuples
- returns array of storate tuples, array could be empty, if no data storated.
```

