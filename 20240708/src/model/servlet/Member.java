package model.servlet;

import java.util.Arrays;

public class Member {
	private String name;
	private String gender;
	private String grade;
	private String[] inter;
	
	public Member() {
	}

	public Member(String name, String gender, String grade, String[] inter) {
		this.name = name;
		this.gender = gender;
		this.grade = grade;
		this.inter = inter;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String[] getInter() {
		return inter;
	}

	public void setInter(String[] inter) {
		this.inter = inter;
	}
	
	// 배열을 출력하는 메서드 만들기
	public String printArray() {
		
		return Arrays.deepToString(inter);
		/*
		 * for(int i = 0; i < inter.length; i++) { System.out.println(inter[i]); }
		 */
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", gender=" + gender + ", grade=" + grade + ", inter="
				+ Arrays.toString(inter) + "]";
	}
	
}
