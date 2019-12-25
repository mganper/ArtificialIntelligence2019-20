package aima.core.environment.selatt;

import aima.core.environment.nqueens.*;
import aima.core.search.framework.problem.GoalTest;

/**
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodríguez, Sergio
 */
public class SelAttGoalTest implements GoalTest {

	public boolean isGoalState(Object state) {
		return false;
	}
}