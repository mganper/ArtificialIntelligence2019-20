/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aima.core.environment.faroles;

import aima.core.search.framework.problem.GoalTest;

/**
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodriguez, Sergio
 */
public class FarolesGoalTest implements GoalTest {

    FarolesBoard goal = new FarolesBoard(new int[]{0, 0, 0, 0, 0});

    @Override
    public boolean isGoalState(Object state) {
        FarolesBoard board = (FarolesBoard) state;

        return board.equals(goal);
    }

}
