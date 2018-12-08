package top.nanclub.share.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局捕获异常类
 */
@ControllerAdvice
public class GlobalDefaultExceptionHandler {
    /**
     * 返回为view时 返回modelandview
     * 返回为String json时 返回String 并添加@ResponseBody
     * defaultExceptionHandler
     *
     * @author Administrator
     * @param req
     * @param e
     * @return
     * @since JDK 1.7
     */
    @ExceptionHandler(Exception.class)
    public ModelAndView defaultExceptionHandler(HttpServletRequest req, Exception e)
    {
        return new ModelAndView("error");
    }
}
