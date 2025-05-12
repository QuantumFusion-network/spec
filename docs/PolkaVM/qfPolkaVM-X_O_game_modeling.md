# TODO for TestNet:
1) Get/Set update -> rethink/change a bit write/read policies
2) Deploy to testnet all changes
3) Docs + Examples

# Next versions of qfPolkaVM:
1) Gas limit change via sudo extrinsic
2) Separate fee for the storage
3) Modeling of weight
4) Host functions benchmarks
5) Caller signature check as a feature for the next release

# Modeling of the game:

Language: pseudocode
The game: X|O
Game starter: Alice
Oponent: Bob

## qf-node:

```
 Call: qfPolkaVM execute

 Contract input:


 vm.context[0] -> ENV {
     contract_addr: STR,
     alice_addr: STR,
     caller_addr: [alice_addr | bob_addr],
 }

 vm.context[1] -> args.move {
     bob_addr: STR,
     tuple { int, int } <= step,
 }

 or vm.context[1] -> args.surrender {
   // ...
 }


qfPolkaVM extrinsic context:

  PVM runtime context:

    //
    // NOTE:
    // Q: get/set for mutation of smart contract state or change impl get/set
    // + change doc(!)
    // Conclusion: break current get/set impl + update doc.
    //
    main()

      EVN = get_env() -> vm.context[0]
      args = get_call_args() -> vm.context[1]

      game = {
        dashboard: array[3][3] => 0 // {0 - Null, 1 - X, 2 - 0}
        step: int
        winder_addr: int
        // ...
      }

      merged_game = game {}

      // H is a any hash function
      game_addr = H(ENV.contract_addr + ENV.alice_addr + args.bob_addr)

      if args.move

         // Null means no game
         if storage.get(game_addr) == Null

           storage.set(game_addr, game) or exit "can't create the game"

        //
        // args.move ...
        // merged_game = ...
        // DO MOVE & CHECKS
        //

        storage.set(game_addr, merged_game) or exit "can't save the move"

      else if args.surrender
           // ...
```

# UI e.g dApp game:
1) Connect wallet: PolkaDot Extention
2) Connect to Net: PolkaDot JS -> connect to TestNet
3) Connect to game: PolkaDot -> storage.get(H -> from game) == X => via RPC state_get_storage
4.f) X = Null -> No game: new game, render new board
4.t) X != Null -> Game found: render X
//
// Q: How to handle events?
// A: event execute watching using PolkaJS
// OR A: polling
//
5) PolkaDot JS -> execute main(args.move { ... })
6) go to `3)` until end of game

