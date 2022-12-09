package com.limdaram.ticketing.config;

import lombok.Setter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

@Configuration
@MapperScan(value = "com.limdaram.ticketing.mapper")

public class CustomConfig {

    @Value("${aws.accessKeyId}")
    private String accessKeyId;
    @Value("${aws.secretAccessKey}")
    private String secretAccessKey;
    @Value("${aws.s3.file.url.prefix}")
    private String imgUrl;

    @Setter(onMethod_ = @Autowired)
    private ServletContext servletContext;

    @PostConstruct
    public void init() {
        servletContext.setAttribute("imgUrl", imgUrl);
    }

    @Bean
    public S3Client s3Client() {
        return S3Client.builder()
                .credentialsProvider(awsCredentialsProvider())
                .region(Region.AP_NORTHEAST_2).build();
    }

    @Bean
    public AwsCredentialsProvider awsCredentialsProvider() {
        return StaticCredentialsProvider.create(awsCredentials());
    }

    @Bean
    public AwsCredentials awsCredentials() {
        return AwsBasicCredentials.create(accessKeyId, secretAccessKey);
    }
}
