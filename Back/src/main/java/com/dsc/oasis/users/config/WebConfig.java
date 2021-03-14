package com.dsc.oasis.users.config;

import com.dsc.oasis.users.utils.Encrypt;
import com.dsc.oasis.users.utils.Hashing;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {
    @Bean
    public Encrypt encryptConfigure(){
        return new Hashing();
    }
}
