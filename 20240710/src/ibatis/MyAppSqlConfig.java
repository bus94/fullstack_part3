package ibatis;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// 자바에서 xml 파일을 가져와서 사용하려면 연결해야 된다.
// 가장 먼저 실행되어야 하고 그 후에 객체를 딱 한 번만 만들어서 사용하기 위해서 static 즉 싱글톤 기법으로 만든다.
public class MyAppSqlConfig {
	
	// SqlMapClient
	// sqlMap과 DB 명령문을 실행하고 트랜잭션 관리를 할 수 있는 인터페이스
	private static final SqlMapClient sqlMap;
	
	// 컴파일 시 static들은 먼저 실행
	// 초기화 블록!
	static { 
		// xml 파일을 읽어오기 위해서 명령문을 작성할 때 예외가 발생할 수 있다.
		try {
			// 1. xml 파일의 경로
			String resource = "ibatis/SqlMapConfig.xml";
			
			// 2. 경로에서 파일을 읽어오기
			// Resources 클래스는 ibatis, mybatis에서 xml 파일을 읽어올 때 사용하는 클래스
			// getResourceAsReader(경로) : 실제 로드를 실행하는 메서드 매개변수로 경로를 주면 그 안에 내용들을 모두 읽어서 Reader 객체로 반환한다.
			// IO 입출력 객체들은 IOException을 던진다. (예외처리)
			Reader read = Resources.getResourceAsReader(resource);
			
			// SqlMapClientBuilder 클래스는 SqlMapClient 객체를 생성하는 클래스
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(read);
			
		} catch(Exception e) {
			e.printStackTrace();
			
			// static 초기화 블록에서 sqlMap이 예외가 발생해서 생성이 안되면 DB 내용을 사용할 수 없다. 아예 프로그램을 실행하지 않게 예외를 생성해서 컴파일한테 알려준다. 프로그램 종료되도록 설정!
			throw new RuntimeException("Error: " + e);
		}
	}
	
	public static SqlMapClient getSqlMap () {
		return sqlMap;
	}
	
}
