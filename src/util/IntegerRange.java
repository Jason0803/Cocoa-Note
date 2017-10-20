package util;

// #00099 : IntegerRange
public class IntegerRange {
	private IntegerRange ir = new IntegerRange();
	private IntegerRange() {}
	public IntegerRange getInstance() {
		return ir;
	}
	public static boolean betweenExclusive(int input, int min, int max) {
	       return input > min && input < max;    
	}
	public static boolean betweenInclusive(int input, int min, int max) {
		return input >= min && input <= max;
	}
}
