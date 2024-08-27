package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// xml 파일을 읽어들여서 객체를 생성하는 클래스
public class MySession {
	static SqlSessionFactory factory;
	
	// 정적 초기화 블록에서 설정 파일을 읽어 객체(매퍼)를 생성한다.
	static {
		// 외부에 있는 xml 파일을 읽어서 Reader 객체로 반환한다.
		Reader r = null;
		try {
			r = Resources.getResourceAsReader("mybatis/config.xml");
			SqlSessionFactoryBuilder build = new SqlSessionFactoryBuilder();
			
			// Mybatis 설정 파일을 기반으로 SqlSessionFactory 객체를 생성한다.
			factory = build.build(r);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	// mybatis에서 SqlSession 객체를 이용해서 DB랑 매퍼할 수 있도록 주소값을 반환하는 메서드를 생성한다.
	public static SqlSession getSession() {
		// 기본적으로 openSession SqlSession 객체를 생성한다.
		// 새로운 SqlSession 객체 생성을 하면서 기본적으로 자동 커밋이 비활성화된 상태로 세션을 생성한다.
		// sql문을 실행하고 계속 autoCommit() 항상 호출해야한다.
		
		// SqlSession 객체를 생성할 때 자동커밋하려면 openSession()에 true를 넣어주면 된다.
		return factory.openSession(true);
	}
}
