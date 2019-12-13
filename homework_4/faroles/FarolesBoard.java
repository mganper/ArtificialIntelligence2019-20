package aima.core.environment.faroles;

import aima.core.agent.Action;
import aima.core.agent.impl.DynamicAction;
import java.util.Arrays;

/**
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodriguez, Sergio
 */
public class FarolesBoard {

    public static Action M1000 = new DynamicAction("M1000");

    public static Action M1100 = new DynamicAction("M1100");

    public static Action M1010 = new DynamicAction("M1010");

    public static Action M1001 = new DynamicAction("M1001");

    public static Action M0100 = new DynamicAction("M0100");

    public static Action M0110 = new DynamicAction("M0110");

    public static Action M0101 = new DynamicAction("M0101");

    public static Action M0010 = new DynamicAction("M0010");

    public static Action M0011 = new DynamicAction("M0011");

    public static Action M0001 = new DynamicAction("M0001");

    private int[] state;

    private int tiempo;

    private static int[] tiempos = {1, 2, 4, 8};

//
// PUBLIC METHODS
//
    public FarolesBoard() {
        tiempo = 0;
        state = new int[]{1, 1, 1, 1, 1};
    }

    public FarolesBoard(int[] state) {
        tiempo = 0;
        this.state = new int[state.length];
        System.arraycopy(state, 0, this.state, 0, state.length);
    }

    public FarolesBoard(FarolesBoard copyBoard) {
        this(copyBoard.getState());
        tiempo = copyBoard.getTiempo();
    }

    public int[] getState() {
        return state;
    }

    public int getFarol() {
        return state[4];
    }

    public int getTiempo(){
        return this.tiempo;
    }
    
    public void moveFarolM1000() {
        if (getFarol() == 0) {
            state[0] = 1;
            state[4] = 1;

            tiempo += tiempos[0];

        } else {
            state[0] = 0;
            state[4] = 0;

            tiempo += tiempos[0];

        }

    }

    public void moveFarolM1100() {
        if (getFarol() == 0) {
            state[0] = 1;
            state[1] = 1;
            state[4] = 1;

            tiempo += (tiempos[0] > tiempos[1]) ? tiempos[0] : tiempos[1];

        } else {
            state[0] = 0;
            state[1] = 0;
            state[4] = 0;

            tiempo += (tiempos[0] > tiempos[1]) ? tiempos[0] : tiempos[1];

        }

    }

    public void moveFarolM1010() {
        if (getFarol() == 0) {
            state[0] = 1;
            state[2] = 1;
            state[4] = 1;

            tiempo += (tiempos[0] > tiempos[2]) ? tiempos[0] : tiempos[2];

        } else {
            state[0] = 0;
            state[2] = 0;
            state[4] = 0;

            tiempo += (tiempos[0] > tiempos[2]) ? tiempos[0] : tiempos[2];

        }

    }

    public void moveFarolM1001() {
        if (getFarol() == 0) {
            state[0] = 1;
            state[3] = 1;
            state[4] = 1;

            tiempo += (tiempos[0] > tiempos[3]) ? tiempos[0] : tiempos[3];

        } else {
            state[0] = 0;
            state[3] = 0;
            state[4] = 0;

            tiempo += (tiempos[0] > tiempos[3]) ? tiempos[0] : tiempos[3];

        }

    }

    public void moveFarolM0100() {
        if (getFarol() == 0) {
            state[1] = 1;
            state[4] = 1;

            tiempo += tiempos[1];

        } else {
            state[1] = 0;
            state[4] = 0;

            tiempo += tiempos[1];

        }

    }

    public void moveFarolM0110() {
        if (getFarol() == 0) {
            state[1] = 1;
            state[2] = 1;
            state[4] = 1;

            tiempo += (tiempos[1] > tiempos[2]) ? tiempos[1] : tiempos[2];

        } else {
            state[1] = 0;
            state[2] = 0;
            state[4] = 0;

            tiempo += (tiempos[1] > tiempos[2]) ? tiempos[1] : tiempos[2];

        }

    }

    public void moveFarolM0101() {
        if (getFarol() == 0) {
            state[1] = 1;
            state[3] = 1;
            state[4] = 1;

            tiempo += (tiempos[1] > tiempos[3]) ? tiempos[1] : tiempos[3];

        } else {
            state[1] = 0;
            state[3] = 0;
            state[4] = 0;

            tiempo += (tiempos[1] > tiempos[3]) ? tiempos[1] : tiempos[3];

        }

    }

    public void moveFarolM0010() {
        if (getFarol() == 0) {
            state[2] = 1;
            state[4] = 1;

            tiempo += tiempos[2];

        } else {
            state[2] = 0;
            state[4] = 0;

            tiempo += tiempos[2];

        }

    }

    public void moveFarolM0011() {
        if (getFarol() == 0) {
            state[2] = 1;
            state[3] = 1;
            state[4] = 1;

            tiempo += (tiempos[2] > tiempos[3]) ? tiempos[2] : tiempos[3];

        } else {
            state[2] = 0;
            state[3] = 0;
            state[4] = 0;

            tiempo += (tiempos[2] > tiempos[3]) ? tiempos[2] : tiempos[3];

        }

    }

    public void moveFarolM0001() {
        if (getFarol() == 0) {
            state[3] = 1;
            state[4] = 1;

            tiempo += tiempos[3];

        } else {
            state[3] = 0;
            state[4] = 0;

            tiempo += tiempos[3];

        }

    }

    public boolean canMovePeople(Action where) {
        boolean retVal = true;

        if (where.equals(M1000)) {

            retVal = (state[0] == state[4] && !superaTiempo(tiempo, 0, -1));

        } else if (where.equals(M1100)) {

            retVal = (state[0] == state[1]) && (state[0] == state[4] && !superaTiempo(tiempo, 0, 1));

        } else if (where.equals(M1010)) {

            retVal = (state[0] == state[2]) && (state[0] == state[4] && !superaTiempo(tiempo, 0, 2));

        } else if (where.equals(M1001)) {

            retVal = (state[0] == state[3]) && (state[0] == state[4] && !superaTiempo(tiempo, 0, 3));

        } else if (where.equals(M0100)) {

            retVal = (state[1] == state[4] && !superaTiempo(tiempo, 1, -1));

        } else if (where.equals(M0110)) {

            retVal = (state[1] == state[2]) && (state[1] == state[4] && !superaTiempo(tiempo, 1, 2));

        } else if (where.equals(M0101)) {

            retVal = (state[1] == state[3]) && (state[1] == state[4] && !superaTiempo(tiempo, 1, 3));

        } else if (where.equals(M0010)) {

            retVal = (state[2] == state[4] && !superaTiempo(tiempo, 2, -1));

        } else if (where.equals(M0011)) {

            retVal = (state[2] == state[3]) && (state[2] == state[4] && !superaTiempo(tiempo, 2, 3));

        } else if (where.equals(M0001)) {

            retVal = (state[3] == state[4] && !superaTiempo(tiempo, 3, -1));

        }

        return retVal;
    }

    @Override
    public boolean equals(Object o) {

        if (this == o) {
            return true;
        }
        if ((o == null) || (this.getClass() != o.getClass())) {
            return false;
        }
        FarolesBoard aBoard = (FarolesBoard) o;

        for (int i = 0; i < state.length; i++) {
            if (this.state[i] != aBoard.state[i]) {
                return false;
            }
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Arrays.hashCode(this.state);
        return hash;
    }

    @Override
    public String toString() {
        String retVal = state[0] + " " + state[1] + " " + state[2] + "\n"
                + state[3] + " " + state[4];
        return retVal;
    }

    //
    // PRIVATE METHODS
    //
    private boolean superaTiempo(int tiempo, int persona1, int persona2) {
        if (persona2 != -1) {

            tiempo += (tiempos[persona1] > tiempos[persona2]) ? tiempos[persona1] : tiempos[persona2];

        } else {

            tiempo += tiempos[persona1];

        }

        return tiempo > 15;
    }

}
