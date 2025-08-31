---- MODULE leader ----
EXTENDS Integers, TLC, FiniteSets

Validators == {"v1", "v2", "v3", "v4", "v5"}
minimumValidatorCount == 3

(*--algorithm leaders
variables
    alive = Validators;

process leader = "leader"
begin
    Election:
        while TRUE do
            with l \in Validators do
                either
                    await l \notin alive;
                    alive := alive \union {l};
                or
                    await l \in alive;
                    await Cardinality(alive) > minimumValidatorCount;
                    alive := alive \ {l};
                end either;
            end with;
        end while;
end process;

end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "696cd7bf" /\ chksum(tla) = "c5d75fd8")
VARIABLE alive

vars == << alive >>

ProcSet == {"leader"}

Init == (* Global variables *)
        /\ alive = Validators

leader == \E l \in Validators:
            \/ /\ l \notin alive
               /\ alive' = (alive \union {l})
            \/ /\ l \in alive
               /\ Cardinality(alive) > minimumValidatorCount
               /\ alive' = alive \ {l}

Next == leader

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

====
