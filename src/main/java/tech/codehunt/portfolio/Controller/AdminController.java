package tech.codehunt.portfolio.Controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tech.codehunt.portfolio.dto.AddAboutDto;
import tech.codehunt.portfolio.dto.ServiceDto;
import tech.codehunt.portfolio.entities.AddAboutEntity;
import tech.codehunt.portfolio.entities.ServiceEntity;
import tech.codehunt.portfolio.services.AddAboutIntro;
import tech.codehunt.portfolio.services.ContactService;
import tech.codehunt.portfolio.services.ServicesService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ContactService contactService;

	 @Autowired
	private AddAboutIntro   abountIntro;;;

	@Autowired
	private ServicesService servicesService;

	// ✅ Admin Home
	@GetMapping("/home")
	public String home() {
		return "admin/adminHome";
	}

	// ✅ Read all contacts
	@GetMapping("/readAllContacts")
	public String readAllContacts(Model model) {
		model.addAttribute("contactData", contactService.readAllContacts());
		return "admin/readAllContacts";
	}

	// ✅ Delete contact by id
	@GetMapping("deleteContactById")
	public String deleteContactById(@RequestParam int id, RedirectAttributes redirectAttributes) {
		contactService.deleteContactById(id);
		redirectAttributes.addFlashAttribute("DeleteData", "Delete Data Successfully");
		return "redirect:/admin/readAllContacts";
	}

	// ✅ Add service page view
	@GetMapping("/addService")
	public String addServiceView() {
		return "admin/addService";
	}

	@PostMapping("/addService")
	public String addService(@Valid @ModelAttribute ServiceDto serviceDto, BindingResult result, Model model,
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {

		// Validation errors
		if (result.hasErrors()) {
			model.addAttribute("result", "Invalid Input");
			model.addAttribute("errors", result.getFieldErrors());
			return "admin/addService";
		}

		// File validation
		MultipartFile multipartFile = serviceDto.getServiceFile();
		if (multipartFile == null || multipartFile.isEmpty()) {
			model.addAttribute("fileError", "File must be uploaded");
			return "admin/addService";
		}

		long size = multipartFile.getSize();
		if (size > (2 * 1024 * 1024)) {
			model.addAttribute("fileError", "File size must not exceed 2MB");
			return "admin/addService";
		}

		// Save service
		String realPath = request.getServletContext().getRealPath("img/services");
		servicesService.saveService(realPath, multipartFile, serviceDto);

		// ✅ Add flash message
		redirectAttributes.addFlashAttribute("success", "Service added successfully!");

		// ✅ Redirect back to form page (prevents resubmission)
		return "redirect:/admin/addService";
	}

	@GetMapping("/readAllServices")
	public String readAllServices(Model model) {
		model.addAttribute("listofService", servicesService.readServices());

		return "admin/readAllServices";
	}

	@GetMapping("/deleteService")
	public String deleteService(@RequestParam int id, @RequestParam String filename,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		String realPath = request.getServletContext().getRealPath("img/services");
		servicesService.deleteService(realPath, id, filename);
		redirectAttributes.addFlashAttribute("success", "deleted successfully!");

		return "redirect:/admin/readAllServices";
	}

	@GetMapping("/updateService")
	public String updateServiceView(@RequestParam int id, Model model) {

		Optional<ServiceEntity> service = servicesService.readService(id);

		ServiceEntity serviceEntity = service.get();

		model.addAttribute("service", serviceEntity);

		return "admin/updateService"; // goes to updateService.jsp
	}

	@PostMapping("/updateService")
	public String updateService(@RequestParam int id, @RequestParam String oldFileName,
			@ModelAttribute ServiceDto serviceDto, RedirectAttributes redirectAttributes, HttpServletRequest request)
			throws Exception {
		String realPath = request.getServletContext().getRealPath("img/services");

		// if new file come
		MultipartFile serviceFile = serviceDto.getServiceFile();

		servicesService.updateService(realPath, serviceFile, serviceDto, id, oldFileName);
		redirectAttributes.addFlashAttribute("success", "updated successfully!");

		return "redirect:/admin/readAllServices"; // back to list page
	}

	@GetMapping("/uploadResume")
	public String uploadResumeView() {

		return "admin/uploadResume"; // goes to updateService.jsp
	}

	@PostMapping("/uploadResume")
	public String uploadResume(@RequestParam MultipartFile resume, RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws Exception {

		if (resume == null || resume.isEmpty()) {
			redirectAttributes.addFlashAttribute("result", "Resume must be uploaded");
			return "redirect:/admin/uploadResume";

		}
		long size = resume.getSize();
		if (size > (1 * 1024 * 1024)) {
			redirectAttributes.addFlashAttribute("result", "Resume size must not exceed 1 MB");
			return "redirect:/admin/uploadResume";
		}

		String contentType = resume.getContentType();
		if (contentType == null || !contentType.equalsIgnoreCase("application/pdf")) {
			redirectAttributes.addFlashAttribute("result", "Resume must be in PDF format");
			return "redirect:/admin/uploadResume";
		}

		String realPath = request.getServletContext().getRealPath("/resume/");

		// new file add
		Path path = Paths.get(realPath, "MyResume.pdf");
		File file1 = path.toFile();

		if (file1.exists()) {
			file1.delete();

		}
		resume.transferTo(file1);

		redirectAttributes.addFlashAttribute("result", "Resume Uploaded Succesfully");
		return "redirect:/admin/uploadResume";
	}

	@GetMapping("/uploadProfile")
	public String uploadProfileView() {

		return "admin/uploadProfile";
	}

	@PostMapping("/uploadProfile")
	public String uploadProfile(@RequestParam("profile") MultipartFile profile, RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws Exception {

		if (profile == null || profile.isEmpty()) {
			redirectAttributes.addFlashAttribute("result", "Profile picture must be uploaded");
			return "redirect:/admin/uploadProfile";
		}

		long size = profile.getSize();
		if (size > (2 * 1024 * 1024)) { // 2MB
			redirectAttributes.addFlashAttribute("result", "Profile picture must not exceed 2 MB");
			return "redirect:/admin/uploadProfile";
		}

		String contentType = profile.getContentType();
		if (contentType == null || !contentType.startsWith("image/")) {
			redirectAttributes.addFlashAttribute("result", "Only image files (PNG, JPG, JPEG) are allowed");
			return "redirect:/admin/uploadProfile";
		}

		// Save file
		String realPath = request.getServletContext().getRealPath("/img/banner/");
		// Always overwrite with "profile.jpg"
		Path path = Paths.get(realPath, "profile.jpg");
		File file1 = path.toFile();

		if (file1.exists()) {
			file1.delete();
		}

		profile.transferTo(file1);

		redirectAttributes.addFlashAttribute("result", "Profile picture uploaded successfully");
		return "redirect:/admin/uploadProfile";
	}

	@GetMapping("/addAbountIntro")
	public String addAbountIntroview(@ModelAttribute  AddAboutDto addAboutDto,
	                                 Model model) {
	    model.addAttribute("aboutIntroList", abountIntro.readAboutIntro()); // match JSP
	    return "admin/addAbountIntro";
	}

	@PostMapping("/addAbountIntro")
	public String addAbountIntro(@Valid @ModelAttribute AddAboutDto addAboutDto,
	                             BindingResult bindingResult,
	                             RedirectAttributes redirectAttributes,
	                             Model model) {

	    if (bindingResult.hasErrors()) {
	        if (bindingResult.hasFieldErrors("firstPara")) {
	            model.addAttribute("firstParaError", bindingResult.getFieldError("firstPara").getDefaultMessage());
	        }
	        if (bindingResult.hasFieldErrors("secondPara")) {
	            model.addAttribute("secondParaError", bindingResult.getFieldError("secondPara").getDefaultMessage());
	        }

	        model.addAttribute("result", "Invalid Input");
	        return "admin/addAbountIntro";
	    }

	    abountIntro.saveAbountIntro(addAboutDto);
	    redirectAttributes.addFlashAttribute("result", "About Saved Successfully");
	    return "redirect:/admin/addAbountIntro";
	}

	@GetMapping("/readAllAboutIntro")
	public String readAllAboutIntro(Model model) {
	    model.addAttribute("aboutIntroList", abountIntro.readAboutIntro()); // 👈 match with JSP
	    return "admin/readAllAboutIntro";  
	}


	// ✅ Update (GET)
	@GetMapping("/updateAbountIntro/{id}")
	public String getUpdateAboutIntro(@PathVariable int id, Model model) {
	    Optional<AddAboutEntity> about = abountIntro.readAboutIntroId(id);
	    if (about.isPresent()) {
	        model.addAttribute("intro", about.get()); // match with POST
	    }
	    return "admin/updateAbountIntro";
	}

	// ✅ Update (POST)
	@PostMapping("/updateAbountIntro")
	public String updateAboutIntro(
	        @ModelAttribute("intro") AddAboutEntity updatedIntro,
	        RedirectAttributes redirectAttributes) {

	    abountIntro.updateAboutIntro(updatedIntro);
	    redirectAttributes.addFlashAttribute("result", "Updated Successfully ✅");
	    return "redirect:/admin/readAllAboutIntro";
	}
     
	// ✅ Delete
	@GetMapping("/deleteAbountIntro/{id}")
	public String deleteAbountIntro(@PathVariable int id, RedirectAttributes redirectAttributes) {
	    abountIntro.deleteAbountIntroId(id);
	    redirectAttributes.addFlashAttribute("DeleteData", "Delete Data Successfully");
	    return "redirect:/admin/readAllAboutIntro";
	}


}     
