package aima.core.environment.selatt;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Gandul Pérez, Manuel
 * @author Luzuriaga Rodríguez, Sergio
 */
public class SelAttBoard {

    int[] state;

    public final double[][] correlations = new double[][]{
        {1, 0.64491, 0.65459, 0.48636, 0.52182, 0.58730, 0.55843, 0.53583, 0.35003},
        {0.64491, 1, 0.90688, 0.70558, 0.75180, 0.68680, 0.75572, 0.72286, 0.45869},
        {0.65459, 0.90688, 1, 0.68308, 0.71967, 0.70961, 0.73595, 0.71945, 0.43891},
        {0.48636, 0.70558, 0.68308, 1, 0.59960, 0.66505, 0.66672, 0.60335, 0.41763},
        {0.52182, 0.75180, 0.71967, 0.59960, 1, 0.58126, 0.61610, 0.62888, 0.47910},
        {0.58730, 0.68680, 0.70961, 0.66505, 0.58126, 1, 0.67590, 0.57736, 0.33874},
        {0.55843, 0.75572, 0.73595, 0.66672, 0.61610, 0.67590, 1, 0.66588, 0.34417},
        {0.53583, 0.72286, 0.71945, 0.60335, 0.62888, 0.57736, 0.66588, 1, 0.42834},
        {0.35003, 0.45869, 0.43891, 0.41763, 0.47910, 0.33874, 0.34417, 0.42834, 1},
        {0.71600, 0.81790, 0.81893, 0.69680, 0.68278, 0.81605, 0.75662, 0.71224, 0.42317}
    };

    int size;

    /**
     * Creates a board with <code>size</code> rows. Column indices start with 0.
     */
    public SelAttBoard(int size) {
        this.size = size;
        state = new int[size];
        for (int i = 0; i < size; i++) {
            state[i] = 0;

        }
    }

    public void clear() {
        for (int i = 0; i < size; i++) {
            state[i] = 0;

        }
    }

    public void setBoard(List<Integer> atts) {
        clear();
        for (Integer att : atts) {
            useAttribute(att);
        }
    }

    public int getSize() {
        return size;
    }

    /**
     * Add an attribute in the indicated index.
     *
     * @param index the number of the attribute.
     */
    public void useAttribute(int index) {
        if (!isUsedAttribute(index)) {
            state[index] = 1;
        }
    }

    public void removeAttribute(int index) {
        if (isUsedAttribute(index)) {
            state[index] = 0;
        }
    }

    public boolean isUsedAttribute(int index) {
        return state[index] == 1;
    }

    public int getNumberOfAttributes() {
        int count = 0;
        for (int i = 0; i < size; i++) {
            if (state[i] == 1) {
                count++;
            }

        }
        return count;
    }

    public List<Integer> getAttributes() {
        ArrayList<Integer> result = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            if (isUsedAttribute(i)) {
                result.add(i);
            }
        }
        return result;

    }

    public double getCorrelationOf(int attOne, int attTwo) {
        return correlations[attOne][attTwo];
    }

    @Override
    public int hashCode() {
        List<Integer> inds = getAttributes();
        int result = 17;
        for (Integer ind : inds) {
            result = 37 * ind.hashCode();
        }
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if ((o == null) || (this.getClass() != o.getClass())) {
            return false;
        }
        SelAttBoard aBoard = (SelAttBoard) o;
        boolean retVal = true;
        List<Integer> indexes = getAttributes();

        for (Integer ind : indexes) {
            if (!(aBoard.isUsedAttribute(ind))) {
                retVal = false;
            }
        }
        return retVal;
    }

    public void print() {
        System.out.println(getBoardPic());
    }

    public String getBoardPic() {
        StringBuilder buffer = new StringBuilder();
        buffer.append("[");
        for (int i = 0; (i < size); i++) { // row
            if (isUsedAttribute(i)) {
                buffer.append(" 1 ");
            } else {
                buffer.append(" 0 ");
            }
        }
        buffer.append("]");

        return buffer.toString();
    }

    @Override
    public String toString() {
        StringBuilder buffer = new StringBuilder();
        buffer.append("[");
        for (int i = 0; (i < size); i++) { // row
            if (isUsedAttribute(i)) {
                buffer.append(" 1 ");
            } else {
                buffer.append(" 0 ");
            }
        }
        buffer.append("]");

        return buffer.toString();
    }
}
