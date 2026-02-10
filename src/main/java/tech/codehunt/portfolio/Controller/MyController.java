package tech.codehunt.portfolio.Controller;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tech.codehunt.portfolio.dto.ContactDto;
import tech.codehunt.portfolio.services.AddAboutIntro;
import tech.codehunt.portfolio.services.ContactService;
import tech.codehunt.portfolio.services.ServicesService;

@Controller
@RequestMapping("/client")
public class MyController {

    @Autowired
    private ContactService contactService;
    @Autowired
    private ServicesService servicesService;
    
    @Autowired
	private AddAboutIntro   abountIntro;;;


    @GetMapping("/home")
    public String index(Model model) {
    	model.addAttribute("listofService",servicesService.readServices());
    	model.addAttribute("aboutIntroList", abountIntro.readAboutIntro());
        return "index"; // matches your JSP name
    }

    @GetMapping("/about")
    public String about(Model model) {
    	model.addAttribute("aboutIntroList", abountIntro.readAboutIntro());
        return "about";
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        if(!model.containsAttribute("contactDto")) {
            model.addAttribute("contactDto", new ContactDto());
        }
        return "contact";
    }

    @PostMapping("/saveContact")
    public String saveContact(
            @Valid @ModelAttribute("contactDto") ContactDto contactDto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,    
            Model model) {

        if (bindingResult.hasErrors()) {
            // Individual error messages
            if (bindingResult.hasFieldErrors("name")) {
                model.addAttribute("nameError", bindingResult.getFieldError("name").getDefaultMessage());
            }
            if (bindingResult.hasFieldErrors("email")) {
                model.addAttribute("emailError", bindingResult.getFieldError("email").getDefaultMessage());
            }
            if (bindingResult.hasFieldErrors("subject")) {
                model.addAttribute("subjectError", bindingResult.getFieldError("subject").getDefaultMessage());
            }
            if (bindingResult.hasFieldErrors("message")) {
                model.addAttribute("messageError", bindingResult.getFieldError("message").getDefaultMessage());
            }

           // Return to form with errors and user input   
          model.addAttribute("result","Invalid Input");               
            return "contact";
        }
        if(contactService.isContactEmailExist(contactDto.getEmail())) {
        	  redirectAttributes.addFlashAttribute("result", "You Have Already Sent");
        	  return "redirect:/client/contact";
        }
        // Save if no errors
        contactService.saveContact(contactDto);
        redirectAttributes.addFlashAttribute("result", "Contact Saved Successfully");
        return "redirect:/client/contact";
    }



    @GetMapping("/services")
    public String services(Model model) {
    	model.addAttribute("listofService",servicesService.readServices());
        return "services";
    }
    
    
    @GetMapping("/downloadResume")
    public void downloadResume(HttpServletRequest request,HttpServletResponse response) throws  Exception {
		String realPath = request.getServletContext().getRealPath("/resume/");
		Path path = Paths.get(realPath, "Pravinresume.pdf");
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=Pravinresume.pdf");
		ServletOutputStream outputStream = response.getOutputStream();
		Files.copy(path,outputStream);
		outputStream.flush();
    	 
         
    }
    @GetMapping("/unauthorized")
	public String unauthorizedPage() {

		return "unauthorized";
	}
	@GetMapping("/mylogin")
	public String login() {

		return "login";
	}
}
