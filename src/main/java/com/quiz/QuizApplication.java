package com.quiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
//@MapperScan(basePackages = "com.quiz.*")
@SpringBootApplication
public class QuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(QuizApplication.class, args);
	}
	
//	@Bean
//    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
//        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
//        sessionFactory.setDataSource(dataSource);
//
//        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
//        sessionFactory.setMapperLocations(res);
//
//        return sessionFactory.getObject();
//    }

}
