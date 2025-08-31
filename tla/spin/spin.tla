---- MODULE spin ----
VARIABLE state

ValidState == state \in {"operational", "recovery", "fastChainFinalityProved", "fastChainFinalityNotProved", "recoveryEnded"}

AlwaysValidState == [] ValidState

Init == state = "operational"

Trans(a, b) ==
    /\ state = a
    /\ state' = b

Next ==
    \/ Trans("operational", "fastChainFinalityProved")
    \/ Trans("operational", "fastChainFinalityNotProved")
    \/ Trans("fastChainFinalityProved", "operational")
    \/ Trans("fastChainFinalityNotProved", "recovery")
    \/ Trans("recovery", "recoveryEnded")
    \/ Trans("recoveryEnded", "operational")

Spec == Init /\ [][Next]_state
====
