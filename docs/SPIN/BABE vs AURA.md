# Evaluation of BABE vs. AURA as Base Block Authoring Mechanisms for QF Blockchain's SPIN Protocol

## Introduction

This document evaluates two Substrate block authoring algorithms - BABE (Blind Assignment for Blockchain Extension) and AURA (Authority-based Round-Robin Scheduling) - and presents the justification for selecting AURA as the base block authoring layer for QF blockchain's SPIN protocol implementation.

## SPIN Protocol Context

The SPIN consensus protocol is a hybrid approach where:
- The **Fast Chain** (QF) produces blocks rapidly (100ms target)
- A **Primary Leader** produces blocks during its _tenure_
- Validators finalize blocks using native finality gadget (GRANDPA, f.e.)
- Added security comes from anchoring to Polkadot through a **Bridging Gadget** (a light-client FSM that relays Fast-Chain proofs to the Anchor chain and vice-versa)
- Lightweight block authoring algorithm

## Comparative Analysis

### 1. Leader Selection

**AURA:**
- Implements deterministic round-robin scheduling using a simple formula: `author = authorities[slot % n]`, where `n` is the length of the current `authorities` list.
- Future block producers are predictable indefinitely - as long as the authorities list remains unchanged
- Provides consistent and predictable block production schedule
- Simpler to reason about and implement

**BABE:**
- Uses a per-slot VRF (Verifiable Random Function) lottery system
- Only reveals validator subset one epoch (approximately 8-12 hours) in advance
- Exact block authors are revealed only when blocks appear
- Adds cryptographic unpredictability to block production

**Note:** SPIN already groups many 100ms slots into a single _tenure_ handled by one Primary Leader, making AURA's deterministic scheduling a natural fit for this architecture.

### 2. Computational Complexity

**AURA:**
- Requires only one modulo operation for slot assignment calculation
- Additional computational work includes verifying that the given header is sealed by the rightful author of the block
- Minimizes CPU usage on validator nodes
- Maintains consistent performance across all nodes
- Provides more computational headroom for transaction processing
- Better suited for resource-constrained environments

**BABE:**
- Requires VRF signing for each validator attempting to produce a block
- Needs proof verification for each received block
- Handles duplicate block processing when multiple validators produce blocks
- Adds some time consumption overhead per slot
- Increases CPU usage at fast block times

**Note:** At SPIN 100ms block times, BABE's higher computational requirements significantly reduce the available processing time for actual transactions, while AURA keeps sufficient headroom for transaction execution.

### 3. Network Efficiency

**AURA:**
- Produces exactly one header per slot (unless a fork occurs)
- Minimizes network bandwidth requirements
- Reduces propagation latency with fewer messages
- Provides more predictable network utilization
- Lower baseline traffic; scales better because traffic grows linearly with validator count.

**BABE:**
- Can produce one to many headers per slot depending on how many validators qualify
- Creates orphan blocks that waste network resources
- Increases bandwidth usage as slots become shorter
- Shows higher network traffic in testing
- Network congestion risk increases with validator count as more validators may produce competing blocks for the same slot

**Note:** Lower baseline traffic with AURA is particularly valuable for SPIN.

### 4. Security Considerations

**AURA:**
- Allows attackers to schedule targeted DDoS attacks at precise times
- Block producers are known well in advance for the entire schedule
- More vulnerable to targeted attacks on specific validators
- No major production networks were identified using AURA as their main consensus
- Simpler attack surface with fewer cryptographic components

**BABE:**
- Requires attackers to target a subset of validators for a full epoch
- Increases attack costs through unpredictability
- Makes targeted attacks more difficult to coordinate
- Used in production by many parachains, demonstrating real-world security
- More complex attack surface with additional cryptographic components

**Note:** The Bridging Gadget slashes long-offline validators; validator keys can be geo-redundant. With QF's small validator set (at early stages), BABE's security advantage is reduced, while SPIN's recovery mechanisms provide additional protection.

### 5. Implementation & Maintenance

**AURA:**
- Provides minimal code paths for easier debugging
- Simplifies auditing with less complexity
- Avoids epoch-randomness corner cases
- Requires less testing to ensure correctness
- Better facilitates future modifications and optimizations

**BABE:**
- Contains more components, which increases code complexity
- Includes built-in secondary authoring that SPIN replaces anyway
- Requires more extensive testing
- Has more potential for subtle bugs in edge cases
- More difficult to customize for SPIN's specific requirements

**Note:** A simpler base block authoring mechanism makes debugging SPIN's recovery mechanisms easier and reduces overall system complexity, leading to a more maintainable codebase.

## Final Justification

AURA naturally fits into a long Tenure, providing validator CPU efficiency, while SPIN's Secondary-Leader mechanism, Bridging-Gadget slashing, and Polkadot finality effectively neutralize AURA's security disadvantages.

Therefore, **AURA is the deliberate and best-fitting choice** for QF's SPIN consensus layer.

## Further Research Required

1. **Timing-Manipulation Attack**  
   We must analyse the slot-time manipulation attack described by Xinrui Zhang et al., "[Time-manipulation Attack: Breaking Fairness against Proof of Authority Aura](https://fififish.github.io/sisiduan/files/time-www23-compressed.pdf)" (The Web Conf (WWW) ’23) and adapt AURA or SPIN parameters if the attack proves practical in a 100 ms-slot, long-Tenure setting.

2. **AURA Fork-Rate under Long Tenure** 
    Further analyze AURA's fork behavior under SPIN's long tenure mechanics to ensure proper functioning and identify any potential issues.