/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aima.core.environment.faroles;

import aima.core.search.framework.evalfunc.HeuristicFunction;

/**
 *
 * @author Manuel Gandul
 */
public class FarolesHeuristicFunction implements HeuristicFunction {

    @Override
    public double h(Object state) {
        FarolesBoard board = (FarolesBoard) state;
        int sum = 0;
        int numPersonas = board.getState().length - 1;

        for (int i = 0; i < numPersonas; i++) {
            if (board.getState()[i] == 1) {
                sum++;
            }
        }
        return (sum / 2);
    }

}
