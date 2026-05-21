/**
 * Calculates the cost in tokens for 'n' votes in a Quadratic Voting system.
 * Cost = votes^2
 */
function calculateTokenCostForVotes(numVotes) {
    const cost = BigInt(numVotes) * BigInt(numVotes);
    return cost.toString();
}

module.exports = { calculateTokenCostForVotes };
