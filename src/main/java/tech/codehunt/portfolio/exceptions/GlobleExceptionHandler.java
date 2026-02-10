package tech.codehunt.portfolio.exceptions;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class GlobleExceptionHandler {
	
	 
	 @ExceptionHandler(Exception.class)
    public String handleGeneralException(Exception e,
                                         RedirectAttributes redirectAttributes,
                                         HttpServletRequest request) {
        String header = request.getHeader("referer"); // previous page
        redirectAttributes.addFlashAttribute("error",
                "⚠️ Something went wrong: " + e.getMessage());
        return "redirect:" + (header != null ? header : "/admin/readAllServices");
    }

    // Catch file upload size exceeded
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxUploadSizeExceededException(MaxUploadSizeExceededException e,
                                                       RedirectAttributes redirectAttributes,
                                                       HttpServletRequest request) {
        String header = request.getHeader("referer");
        redirectAttributes.addFlashAttribute("error", "⚠️ File size must not exceed 5MB");
        return "redirect:" + (header != null ? header : "/admin/readAllServices");
    }

}
