package aima.gui.demo.search;

import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import aima.core.agent.Action;
import aima.core.environment.faroles.FarolesBoard;
import aima.core.environment.faroles.FarolesFunctionFactory;
import aima.core.environment.faroles.FarolesGoalTest;
import aima.core.environment.faroles.FarolesHeuristicFunction;
import aima.core.search.framework.*;
import aima.core.search.framework.problem.Problem;
import aima.core.search.framework.qsearch.GraphSearch;
import aima.core.search.informed.GreedyBestFirstSearch;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthFirstSearch;

/**
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodriguez, Sergio
 */
public class FarolesDemo {

    static FarolesBoard boardInicial = new FarolesBoard(
            new int[]{1, 1, 1, 1, 1});

    public static void main(String[] args) {
        mcBreadthDemo();
        mcDepthGraphDemo();
        farolesGreedyBestFirstHeuristicDemo();
    }

    private static void mcBreadthDemo() {
        System.out.println("\nFarolesDemo breadth -->");
        try {
            Problem problem = new Problem(boardInicial, FarolesFunctionFactory.getActionsFunction(), FarolesFunctionFactory.getResultFunction(), new FarolesGoalTest());
            SearchForActions search = new BreadthFirstSearch();
            SearchAgent agent = new SearchAgent(problem, search);
            printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void mcDepthGraphDemo() {
        System.out.println("\nFarolesDemo depth graph -->");
        try {
            Problem problem = new Problem(boardInicial, FarolesFunctionFactory.getActionsFunction(), FarolesFunctionFactory.getResultFunction(), new FarolesGoalTest());
            SearchForActions search = new DepthFirstSearch(new GraphSearch());
            SearchAgent agent = new SearchAgent(problem, search);
            printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void farolesGreedyBestFirstHeuristicDemo() {
        System.out.println("\nFarolesDemo Greedy Best First Search (Heursitic)-->");
        try {
            Problem problem = new Problem(new FarolesBoard(), FarolesFunctionFactory.getActionsFunction(),
                    FarolesFunctionFactory.getResultFunction(), new FarolesGoalTest());
            SearchForActions search = new GreedyBestFirstSearch(new GraphSearch(), new FarolesHeuristicFunction());
            SearchAgent agent = new SearchAgent(problem, search);
            printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());
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
