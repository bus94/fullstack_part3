package com.project.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSession {
	static SqlSessionFactory f;

	static {
		try {
			Reader r = Resources.getResourceAsReader("com/project/mybatis/config.xml");

			SqlSessionFactoryBuilder bu = new SqlSessionFactoryBuilder();

			f = bu.build(r);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSession getSqlSession() {
		return f.openSession(true);
	}
}
