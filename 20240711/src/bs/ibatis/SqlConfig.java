package bs.ibatis;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlConfig {
	private static final SqlMapClient sqlMap;
	
	// 어떤 코드보다 가장 먼저 실행될 수 있도록 static 블록을 이용한다.
	static {
		// final로 선언된 변수를 초기화 시키기 위해서 두 줄 이상이 필요하다 static{ ~ } 내부에 적어준다.
		try {
			// xml 파일 읽기
			Reader reader = Resources.getResourceAsReader("bs/ibatis/config.xml");
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader); // SqlMapClient는 인터페이스이므로 그것을 도와주는 Client 역할이 buildSqlMapClient이다.
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	public static SqlMapClient getSqlMap() {
		return sqlMap;
	}
}