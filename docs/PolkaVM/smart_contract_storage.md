## Storage

The QF PolkaVM Smart contract storage design and requirements.

## Features

- Allows to store on chain data using key-value like API.
- Allows to read/write stored data only by owner (i.e. data belongs to account) of this data.
- Supports encode/decode complex sturctures [not in the first implmentation]: bool, u{8,16,32,64,128}, i{8,16,32,64,128}, String, tuples, and arrays.

The references:
(1) https://use.ink/docs/v5/basics/storing-values
(2) https://use.ink/docs/v5/basics/reading-values
(3) https://use.ink/docs/v5/basics/mutating-values

## Proposed API

### Getting a stored value

For getting a non-mutable reference to data.
```
storage.get(X) = any_of (bool, u{8,16,32,64,128}, i{8,16,32,64,128}, String, tuples, arrays, None),
Where:
- X is a key with type String;
- Iff any_of === None means no value found by given key;
- the returned data is not a reference and can't be used for mutating a value.
```

### Set a new value or mutate a stored value

For storing a data by given key.
```
storage.set(X, V) = any_of(true or false)
Where:
- X is a key with type String.
- returns true, if value is stored, false if not.
```

### Purge storage

For purge all storated data in one call.
```
storage.purge() = any_of(true or false)
```

### List
TODO
```
TODO
```

