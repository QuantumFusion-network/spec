# Proposal

This document describe NOMT problems and solutions.

## Problems at Dec 2024 - Jan 2025

- (1) Data mingration into the NOMT for existing chains.
- (2) NOMT developments: prefix and bound operation, iterators.
- (3) Integrate NOMT for parachains.
- (4) collator optimization.
- (5) Also should mention: ZK Proof disscutions; it could add more tickets to NOMT and to Substrate.

**Important things for us:** For our project the most importants things are (2) and (3).

References:
- https://github.com/paritytech/polkadot-sdk/issues/5614
- https://layerzero.network/publications/QMDB_13Jan2025_v1.0.pdf

## Possible solution for (2)

:warning: Pseudo code can be changed & corrected while we are develop & test the solution as well as
performance section.

### Pseudo code

- At [https://github.com/thrumdev/nomt/blob/master/nomt/src/beatree/ops/mod.rs](https://github.com/thrumdev/nomt/blob/master/nomt/src/beatree/ops/mod.rs):
```
// Bref: this function if for searching pallet root node
function lookup_pallet(prefix, bbn_index);
Input: 	prefix: 128 bit pallet prefix (result of twox128(pallet name))
		bbn_index: beatree handle
Output: BranchNode representing the sub root of this pallet in the tree

branch = bbn_index.lookup(prefix)
if branch = None then
	return None
else
	return branch.get_branch()
```

- At [https://github.com/thrumdev/nomt/blob/master/nomt/src/beatree/ops/mod.rs](https://github.com/thrumdev/nomt/blob/master/nomt/src/beatree/ops/mod.rs):
```
// Bref: this function if for iterating sub nodes of a pallet
function next_branch(prefix, bbn_indexx, branch);
Input: prefix: pallet prefix
	   bbn_index: beatree shared index
	   iterator: current BranchNode
Output: BranchNode: next sub tree node

branch = lookup_pallet(branch.prefix(), bbn_index)
if branch = None then
    return None
branch.next_key(prefix)
```

- At [https://github.com/thrumdev/nomt/blob/master/nomt/src/beatree/ops/mod.rs](https://github.com/thrumdev/nomt/blob/master/nomt/src/beatree/ops/mod.rs):
```
// Bref: this functions if for get leaf nodes of a last parent node
function get_leafs(branch)
Input: branch: BranchNode currently iterating
Output: all leafs of a branch
let values: []
for i = 0 to branch.n()
    leaf_pn = branch.node_pointer(i)
	leaf = LeafNode(leaf_store.query(leaf_pn))
    value_result = leaf.get(key)
	if value_result is None:
	    return None
	value, is_overflow = value_result
	if is_overflow:
	    value[i] = read_overflow(value, leaf_store)
	else:
	    value[i] = copy(value)
return values
```

### O (n)
- lookup_pallet__
This function uses beatree and btree to search 128 bit pallet prefix key; it takes at most O(N/16) = O(32)
- next_branch__
This function traverses btree to find next branch; it takes O(32).
-- get_leafs__
- This function gets all leaf nodes and get values from them. A branch has 16 children and it takes O(16).
- Overall processing of all accounts of a pallet takes O(N * logN)

## Next steps & questions
- Processing pallet accounts inside of the beatree to improve iterating performance O(N + N/15). Performance is not the best since it's a brute force approach.
- Detailed design about how to expose future prefix API from btree -> beatree -> nomt -> kvdb-nomt should be described.
- Solution for caching pallet nodes. Seems it could be in-memory simple cache.
- Introduce brute force solution for prefix and iterations, which is iterate over all NOMT data also should be implmented at least for testing puposes.
