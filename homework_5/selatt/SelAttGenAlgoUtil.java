package aima.core.environment.selatt;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import aima.core.search.framework.problem.GoalTest;
import aima.core.search.local.FitnessFunction;
import aima.core.search.local.Individual;
import aima.core.util.datastructure.XYLocation;

/**
 * A class whose purpose is to provide static utility methods for solving the
 * n-queens problem with genetic algorithms. This includes fitness function,
 * goal test, random creation of individuals and convenience methods for
 * translating between between an NQueensBoard representation and the Integer list
 * representation used by the GeneticAlgorithm.
 * 
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodríguez, Sergio
 * 
 */
public class SelAttGenAlgoUtil {

	public static FitnessFunction<Integer> getFitnessFunction() {
		return new SelAttFitnessFunction();
	}
	
	public static GoalTest getGoalTest() {
		return new SelAttGoalTest();
	}
	

	public static Individual<Integer> generateRandomIndividual(int boardSize) {
		List<Integer> individualRepresentation = new ArrayList<>();
		for (int i = 0; i < boardSize; i++) {
			individualRepresentation.add(new Random().nextInt(boardSize));
		}
		Individual<Integer> individual = new Individual<>(individualRepresentation);
		return individual;
	}

	public static Collection<Integer> getFiniteAlphabetForBoardOfSize(int size) {
		Collection<Integer> fab = new ArrayList<>();

		for (int i = 0; i < size; i++) {
			fab.add(i);
		}

		return fab;
	}
	
	public static class SelAttFitnessFunction implements FitnessFunction<Integer> {

                @Override
		public double apply(Individual<Integer> individual) {
			double fitness = 0;
                        
			SelAttBoard board = getBoardForIndividual(individual);
			int boardSize = board.getSize();
                        
                        double[][] correlations = board.correlations;
                        
                        int k = board.getNumberOfAttributes();
                        
                        double rcl = 0;
                        
                        List<Integer> attributes = board.getAttributes();
                        
			// Calculate the number of non-attacking pairs of queens (refer to
			// AIMA
			// page 117).
                        
                        
                        
			List<XYLocation> qPositions = board.getQueenPositions();
			for (int fromX = 0; fromX < (boardSize - 1); fromX++) {
				for (int toX = fromX + 1; toX < boardSize; toX++) {
					int fromY = qPositions.get(fromX).getYCoOrdinate();
					boolean nonAttackingPair = true;
					// Check right beside
					int toY = fromY;
					if (board.queenExistsAt(new XYLocation(toX, toY))) {
						nonAttackingPair = false;
					}
					// Check right and above
					toY = fromY - (toX - fromX);
					if (toY >= 0) {
						if (board.queenExistsAt(new XYLocation(toX, toY))) {
							nonAttackingPair = false;
						}
					}
					// Check right and below
					toY = fromY + (toX - fromX);
					if (toY < boardSize) {
						if (board.queenExistsAt(new XYLocation(toX, toY))) {
							nonAttackingPair = false;
						}
					}

					if (nonAttackingPair) {
						fitness += 1.0;
					}
				}
			}

			return fitness;
		}
	}

	public static class SelAttGenAlgoGoalTest implements GoalTest {
		private final SelAttGoalTest goalTest = new SelAttGoalTest();

		@SuppressWarnings("unchecked")
		public boolean isGoalState(Object state) {
			return goalTest.isGoalState(getBoardForIndividual((Individual<Integer>) state));
		}
	}

	public static SelAttBoard getBoardForIndividual(Individual<Integer> individual) {
		int boardSize = individual.length();
		SelAttBoard board = new SelAttBoard(boardSize);
                
		for (int i = 0; i < boardSize; i++) {
			int att = individual.getRepresentation().get(i);
			board.useAttribute(att);
		}

		return board;
	}
}