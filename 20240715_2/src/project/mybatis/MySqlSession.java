package project.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 클래스 이름은 아무거나 작성해도 된다.
// 1. SqlSession 객체를 생성할 수 있도록
// 2. SqlSessionFactory 먼저 생성해야한다. SqlSessionFactory는 인터페이스이므로 객체 생성이 안된다.
// 3. SqlSessionFactoryBuilder 클래스 
// 4. static 블록을 이용해서 초기화한다.
// 5. SqlSession 객체를 반환하는 메서드
public class MySqlSession {
	static SqlSessionFactory f;
	static {
		try {
			// 1. xml 파일 읽어오기
			Reader r = Resources.getResourceAsReader("project/mybatis/config.xml");
			
			// 2. SqlSessionFactoryBuilder 객체 생성
			SqlSessionFactoryBuilder build = new SqlSessionFactoryBuilder();
			
			// 3. build(읽어온 xml 파일을 저장한다)
			f = build.build(r);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSql() {
		return f.openSession(true);
	}
}
