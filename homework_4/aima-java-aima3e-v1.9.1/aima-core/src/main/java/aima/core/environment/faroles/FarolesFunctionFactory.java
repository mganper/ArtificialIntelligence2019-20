package aima.core.environment.faroles;

import java.util.LinkedHashSet;
import java.util.Set;

import aima.core.agent.Action;
import aima.core.search.framework.problem.ActionsFunction;
import aima.core.search.framework.problem.ResultFunction;

/**
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodriguez, Sergio
 */
public class FarolesFunctionFactory {

    private static ActionsFunction _actionsFunction = null;
    private static ResultFunction _resultFunction = null;

    public static ActionsFunction getActionsFunction() {
        if (null == _actionsFunction) {
            _actionsFunction = new EPActionsFunction();
        }
        return _actionsFunction;
    }

    public static ResultFunction getResultFunction() {
        if (null == _resultFunction) {
            _resultFunction = new EPResultFunction();
        }
        return _resultFunction;
    }

    private static class EPActionsFunction implements ActionsFunction {

        public Set<Action> actions(Object state) {
            FarolesBoard board = (FarolesBoard) state;

            Set<Action> actions = new LinkedHashSet<Action>();

            if (board.canMovePeople(FarolesBoard.M1000)) {
                actions.add(FarolesBoard.M1000);
            }
            if (board.canMovePeople(FarolesBoard.M1100)) {
                actions.add(FarolesBoard.M1100);
            }
            if (board.canMovePeople(FarolesBoard.M1010)) {
                actions.add(FarolesBoard.M1010);
            }
            if (board.canMovePeople(FarolesBoard.M1001)) {
                actions.add(FarolesBoard.M1001);
            }
            if (board.canMovePeople(FarolesBoard.M0100)) {
                actions.add(FarolesBoard.M0100);
            }
            if (board.canMovePeople(FarolesBoard.M0110)) {
                actions.add(FarolesBoard.M0110);
            }
            if (board.canMovePeople(FarolesBoard.M0101)) {
                actions.add(FarolesBoard.M0101);
            }
            if (board.canMovePeople(FarolesBoard.M0010)) {
                actions.add(FarolesBoard.M0010);
            }
            if (board.canMovePeople(FarolesBoard.M0011)) {
                actions.add(FarolesBoard.M0011);
            }
            if (board.canMovePeople(FarolesBoard.M0001)) {
                actions.add(FarolesBoard.M0001);
            }
            return actions;
        }
    }

    private static class EPResultFunction implements ResultFunction {

        public Object result(Object s, Action a) {
            FarolesBoard board = (FarolesBoard) s;

            if (FarolesBoard.M1000.equals(a)
                    && board.canMovePeople(FarolesBoard.M1000)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM1000();
                return newBoard;
            } else if (FarolesBoard.M1100.equals(a)
                    && board.canMovePeople(FarolesBoard.M1100)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM1100();
                return newBoard;
            } else if (FarolesBoard.M1010.equals(a)
                    && board.canMovePeople(FarolesBoard.M1010)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM1010();
                return newBoard;
            } else if (FarolesBoard.M1001.equals(a)
                    && board.canMovePeople(FarolesBoard.M1001)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM1001();
                return newBoard;
            } else if (FarolesBoard.M0100.equals(a)
                    && board.canMovePeople(FarolesBoard.M0100)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM0100();
                return newBoard;
            } else if (FarolesBoard.M0110.equals(a)
                    && board.canMovePeople(FarolesBoard.M0110)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM0110();
                return newBoard;
            } else if (FarolesBoard.M0101.equals(a)
                    && board.canMovePeople(FarolesBoard.M0101)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM0101();
                return newBoard;
            } else if (FarolesBoard.M0010.equals(a)
                    && board.canMovePeople(FarolesBoard.M0010)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM0010();
                return newBoard;
            } else if (FarolesBoard.M0011.equals(a)
                    && board.canMovePeople(FarolesBoard.M0011)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM0011();
                return newBoard;
            } else if (FarolesBoard.M0001.equals(a)
                    && board.canMovePeople(FarolesBoard.M0001)) {
                FarolesBoard newBoard = new FarolesBoard(board);
                newBoard.moveFarolM0001();
                return newBoard;
            }

            // The Action is not understood or is a NoOp
            // the result will be the current state.
            return s;
        }
    }
}
