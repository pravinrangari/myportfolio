package tech.codehunt.portfolio.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ServiceDto {

	
	@NotBlank(message = "⚠️ Title is required")
	@Size(min = 3, max = 50, message = "⚠️ Title must be between 3 and 50 characters")
	private String title;

	@NotBlank(message = "⚠️ Description is required")
	@Size(min = 10, max = 500, message = "⚠️ Description must be between 10 and 500 characters")
	private String description;     


	 private MultipartFile serviceFile;
}
