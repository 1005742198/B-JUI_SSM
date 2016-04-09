package obob.test;

import java.util.ArrayList;

class MyException extends Exception{
	static String str;
	public MyException(String str){
		this.str=str;
	}
	public static String getStr(){
		return str;
	}
}
public class Test {
	public static void main(String []args) {
		System.out.println(MyException.getStr());
	}
}
