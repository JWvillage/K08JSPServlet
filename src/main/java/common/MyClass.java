package common;

public class MyClass {
	
	public static int myFunc(int a, int b) {
		int sum = 0;
		for(int i = a; i <= b; i++) {
			sum += i;
		}
		return sum;
	}
	
	public static String gugudan(int x, int y) {
		String result = new String();
		for(int dan = x; dan <= y; dan++) {
			for(int su = 1; su <= 9; su++) {
				result += dan + " * " + su + " = " + dan * su + " ";
			}
			result += "<br>";
		}
		return result;
	}
}
