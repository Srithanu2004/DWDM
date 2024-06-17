decision_tree <- "
digraph DecisionTree {
    node [shape=box]
    
    # Decision Node
    decision [label='Expand Factory?']
    
    # Expand branch
    expand_good [label='Good Economy\n45% chance\nNet Revenue: $5M']
    expand_bad [label='Bad Economy\n55% chance\nNet Revenue: $1M']
    
    # Do Not Expand branch
    noexpand_good [label='Good Economy\n45% chance\nNet Revenue: $4M']
    noexpand_bad [label='Bad Economy\n55% chance\nNet Revenue: $1.5M']
    
    # Edges
    decision -> expand [label='Expand\nCost: $2M']
    decision -> noexpand [label='Do Not Expand']
    
    expand -> expand_good
    expand -> expand_bad
    
    noexpand -> noexpand_good
    noexpand -> noexpand_bad
}
"

# Render the decision tree
grViz(decision_tree)
# Given probabilities
p_good <- 0.45
p_bad <- 0.55

# Net revenues
revenue_expand_good <- 7 - 2
revenue_expand_bad <- 3 - 2
revenue_noexpand_good <- 4
revenue_noexpand_bad <- 1.5

# Expected net revenues
expected_expand <- p_good * revenue_expand_good + p_bad * revenue_expand_bad
expected_noexpand <- p_good * revenue_noexpand_good + p_bad * revenue_noexpand_bad

expected_expand
expected_noexpand