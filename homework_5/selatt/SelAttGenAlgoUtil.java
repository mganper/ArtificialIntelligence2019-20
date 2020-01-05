package aima.core.environment.selatt;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import aima.core.search.framework.problem.GoalTest;
import aima.core.search.local.FitnessFunction;
import aima.core.search.local.Individual;

/**
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
            SelAttBoard board = getBoardForIndividual(individual);

            double[][] correlations = board.correlations;

            int k = board.getNumberOfAttributes();

            List<Integer> attributes = board.getAttributes();

            double rcl = 0;

            for (int i = 0; i < attributes.size(); i++) {
                rcl += correlations[attributes.size()][attributes.get(i)];
            }

            rcl /= k;

            double rat = 0;

            for (int i = 0; i < attributes.size(); i++) {
                for (int j = i; j < attributes.size(); j++) {
                    rat += board.getCorrelationOf(attributes.get(i), attributes.get(j));
                }
            }

            rat /= k;

            double upAux = k * rcl;
            double downAux = k + (k * (k - 1) * rat);

            double fitness = upAux / (Math.sqrt(downAux));

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
