package com.ming.news.config;


import com.ming.news.exception.AbstractNewsException;
import com.ming.news.model.dto.RequestResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author ming
 */
@ControllerAdvice
@ResponseBody
public class ExceptionHandlerAdvice {

    @ExceptionHandler(AbstractNewsException.class)
    public RequestResult handleException(AbstractNewsException e) {
        return new RequestResult<>(e.getStatEnum(), null);
    }
}
