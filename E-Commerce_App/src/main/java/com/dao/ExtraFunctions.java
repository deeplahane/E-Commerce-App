package com.dao;

public class ExtraFunctions {
	public static String get10Words(String str) {
		String[] s=str.split(" ");
		if(str.length()>10) {
			String res="";
			for(int i=0;i<10;i++) {
				res=res+s[i]+" ";
			}
			return res+"...";
		}
		return str;
	}
	
	public static String get6Words(String str) {
		String[] s=str.split(" ");
		if(str.length()>6) {
			String res=""; 
			for(int i=0;i<6;i++) {
				res=res+s[i]+" ";
			}
			return res+"...";
		}
		return str;
	}
}
