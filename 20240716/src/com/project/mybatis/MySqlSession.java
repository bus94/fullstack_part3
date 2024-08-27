package com.project.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 실제 가장 먼저 DB의 정보를 읽어와서 데이터를 객체화 시켜서 공유하는 역할로 사용한다.
// SqlSessionFactory DB를 관리하는 공장
public class MySqlSession {
	static SqlSessionFactory f;
	
	// 초기화 블록을 사용해서 공장을 만들고 공장에서 DB를 관리할 수 있도록 xml 파일의 내용을 전부 읽어서 설정한다.
	static {
		try {
			// DB 정보를 읽어 자바로 가지고 오는 역할
			// 외부에서 파일을 읽어오기 때문에 IOException 발생할 수 있으므로 try~catch문을 사용
			// 아래의 순서는 무관
			// 1. xml 파일 읽기 (설정 xml 파일 까지 입력하기!!!!!!!!!!!!!!!!)
			Reader r = Resources.getResourceAsReader("com/project/mybatis/config.xml");
			
			// 2. SqlSessionFactoryBuilder 객체 생성
			SqlSessionFactoryBuilder bu = new SqlSessionFactoryBuilder();
			
			// 3. 공장에 어떤 DB를 관리할 지 설정
			f = bu.build(r);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	// DB가 필요할 때마다 실제 마이바티스에 접근하는 SqlSession 객체가 필요하다.
	public static SqlSession getSqlSession() {
		// 자동커밋기능이 비활성화된 상태이므로 명령문 작성할 때마다 commit() 호출해야한다.
		// true를 통해 자동커밋기능 활성화 시켜두기
		return f.openSession(true);
		// f.openSession()라는 SqlSession을 통해 전달
	}
}
