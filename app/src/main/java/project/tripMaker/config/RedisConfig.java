//package project.tripMaker.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.connection.RedisConnectionFactory;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.serializer.StringRedisSerializer;
//
////@Configuration
//public class RedisConfig {
//
////  @Bean
////  public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory connectionFactory) {
////    RedisTemplate<String, String> template = new RedisTemplate<>();
////    template.setConnectionFactory(connectionFactory);
////    return template;
////  }
//
//  @Bean
//  public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory connectionFactory) {
//    RedisTemplate<String, Object> template = new RedisTemplate<>();
//    template.setConnectionFactory(connectionFactory);
//
//    // Key와 Value의 Serializer 설정
//    template.setKeySerializer(new StringRedisSerializer());
//    template.setValueSerializer(new StringRedisSerializer()); // 필요하면 Value Serializer도 설정
//    template.setHashKeySerializer(new StringRedisSerializer());
//    template.setHashValueSerializer(new StringRedisSerializer());
//
//    template.afterPropertiesSet();
//    return template;
//  }
//}
