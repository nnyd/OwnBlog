package top.nanclub.share.config;

import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

//@Configuration
public class ErrorConfig {
//    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return (container) -> {
            String err404Address = "/404.html";
            ErrorPage err400 = new ErrorPage(HttpStatus.BAD_REQUEST, err404Address);
            ErrorPage err401 = new ErrorPage(HttpStatus.UNAUTHORIZED, err404Address);
            ErrorPage err404 = new ErrorPage(HttpStatus.NOT_FOUND, err404Address);
            ErrorPage err405 = new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, err404Address);
            ErrorPage err500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, err404Address);
            ErrorPage err503 = new ErrorPage(HttpStatus.SERVICE_UNAVAILABLE, err404Address);
            container.addErrorPages(err400, err401, err404, err405, err500, err503);
        };
    }
}

