import Foundation

// Course: https://www.youtube.com/watch?v=A80YzvNwqXA

// Four functions to solve the backtracking problem:
/// 1. is_valid_state
/// 2. get_candidates
/// 3. search
/// 4. solve (return valid solutions)

func is_valid_state(state){ return true}
func get_candidates(state){ return [] }
func search(state, solutions){
    solutions.append(state.copy())
    for candidate in get_candidates(state){
        state.add(candidate)
        search(state, solutions)
        state.remove(candidate)
    }
}

func solve(){
    solutions = []
    state = Set()
    search(state, solutions)
    return solutinos
}


// Keyword 1: State
/// Backtracking problem is to find a valid state
