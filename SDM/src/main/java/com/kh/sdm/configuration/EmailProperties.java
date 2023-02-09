package com.kh.sdm.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component //등록
@ConfigurationProperties(prefix = "custom.email") //properties에서 불러옴.
public class EmailProperties {
	private String host, username, password;
	private int port;

}
