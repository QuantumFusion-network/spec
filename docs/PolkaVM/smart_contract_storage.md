## Storage

The QF PolkaVM Smart contract storage design and requirements.

## Features

- Allows to store on chain data using key-value like API.
- Allows to read/write stored data only by owner (i.e. data belongs to account) of this data.
> Bref:
> Let say Alice runs a smart contract that stored value = 1 by key "K" using storage.set() function;
> then storage key (or real key) = caller_address.str() + contract_address.str() + "K",
> where `caller_adress` is an address of caller (in this context it's address of Alice)
> `contract_address` is an address of smart contract (`docs/PolkaVM/blob_hashing_addressing.md`).
> For getting value from the storage the same rule is applied.
>
> Hence: storage.get(), storage.set(), storage.erase(), storage.purge() and storage.list() are protecting data from reading/writing storated values from different accounts by design, since address of Alice != addres of Bob.
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
storage.get(X) = K -> any_of (bool, u{8,16,32,64,128}, i{8,16,32,64,128}, String, tuples, arrays, None),
Where:
- X is a key with type String;
- If K = None means no value found by given key;
- the returned data is not a reference and can't be used for mutating a value.
```

### Set a new value or mutate a stored value

For storing a data by given key.
```
storage.set(X, V) :: set(String,  bool | u{8,16,32,64,128} | i{8,16,32,64,128} | String | tuples | arrays) -> bool
Where:
- X is a key with type String;
- returns true, if value is stored, false if not.
```

### Erase stored value by key
For erasing a data by given key.
```
storage.erase(X) = K -> any_of(true or false)
Where:
- X is a key with type String;
- returns true, if value is removed or not existed, false if error occured.
```

### Purge storage

For purge all caller's storated data in one call.
```
storage.purge() = K -> any_of(true or false)
Where:
- returns true, if value is stored, false if not.
```
### Count elements
For get number of storated values (i.e. value is a tuple, values are tuples).
```
storage.count() = K -> any_of(u16)
Where:
- returns number of stored tuples, 0 if no data stored.
```

### List
For list all caller's storated data. All returned values are non-mutable.
```
storage.list([limit, offset]) = K -> any_of([tuples])
Where:
- limit max possible elements in K
- offset shift from begining of storated tuples
- returns array of storate tuples, array could be empty, if no data storated.
```

