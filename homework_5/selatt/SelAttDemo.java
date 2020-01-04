package aima.core.environment.selatt;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import aima.core.agent.Action;
import aima.core.search.framework.problem.GoalTest;
import aima.core.search.local.FitnessFunction;
import aima.core.search.local.GeneticAlgorithm;
import aima.core.search.local.Individual;

/**
 * @author Ravi Mohan
 * 
 */

public class SelAttDemo {

	private static final int individualSize = 9;
        private static int populationSize = 50;
        private static double mutationProb = 0.15;
        private static long time = 5000L;

	public static void main(String[] args) {
		newSelAttDemo();
	}

	private static void newSelAttDemo() {
		selAttGeneticAlgorithmSearch();
	}

	public static void selAttGeneticAlgorithmSearch() {
		System.out.println("\nSelAttDemo GeneticAlgorithm  -->");
		try {
			FitnessFunction<Integer> fitnessFunction = SelAttGenAlgoUtil.getFitnessFunction();
			GoalTest goalTest = SelAttGenAlgoUtil.getGoalTest();
			// Generate an initial population
			Set<Individual<Integer>> population = new HashSet<Individual<Integer>>();
			for (int i = 0; i < populationSize; i++) {
				population.add(SelAttGenAlgoUtil.generateRandomIndividual(individualSize));
			}

			GeneticAlgorithm<Integer> ga = new GeneticAlgorithm<Integer>(individualSize,
					SelAttGenAlgoUtil.getFiniteAlphabetForBoardOfSize(individualSize), mutationProb);

			// Run for a set amount of time
			Individual<Integer> bestIndividual = ga.geneticAlgorithm(population, fitnessFunction, goalTest, time);

			System.out.println("Max Time (1 second) Best Individual=\n"
					+ SelAttGenAlgoUtil.getBoardForIndividual(bestIndividual));
			System.out.println("Board Size      = " + individualSize);
			System.out.println("# Board Layouts = " + (new BigDecimal(individualSize)).pow(individualSize));
			System.out.println("Fitness         = " + fitnessFunction.apply(bestIndividual));
			System.out.println("Is Goal         = " + goalTest.isGoalState(bestIndividual));
			System.out.println("Population Size = " + ga.getPopulationSize());
			System.out.println("Itertions       = " + ga.getIterations());
			System.out.println("Took            = " + ga.getTimeInMilliseconds() + "ms.");

			// Run till goal is achieved
			bestIndividual = ga.geneticAlgorithm(population, fitnessFunction, goalTest, time);

			System.out.println("");
			System.out
					.println("Goal Test Best Individual=\n" + SelAttGenAlgoUtil.getBoardForIndividual(bestIndividual));
			System.out.println("Individual Size      = " + individualSize);
			System.out.println("# Board Layouts = " + (new BigDecimal(individualSize)).pow(individualSize));
			System.out.println("Fitness         = " + fitnessFunction.apply(bestIndividual));
			System.out.println("Is Goal         = " + goalTest.isGoalState(bestIndividual));
			System.out.println("Population Size = " + ga.getPopulationSize());
			System.out.println("Itertions       = " + ga.getIterations());
			System.out.println("Took            = " + ga.getTimeInMilliseconds() + "ms.");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void printInstrumentation(Properties properties) {
		Iterator<Object> keys = properties.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			String property = properties.getProperty(key);
			System.out.println(key + " : " + property);
		}

	}

	private static void printActions(List<Action> actions) {
		for (int i = 0; i < actions.size(); i++) {
			String action = actions.get(i).toString();
			System.out.println(action);
		}
	}

}