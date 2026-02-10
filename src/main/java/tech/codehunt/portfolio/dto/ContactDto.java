package tech.codehunt.portfolio.dto;


import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContactDto {

	
	@NotBlank(message = "⚠️ Name is required")
	@Size(min = 2, max = 30, 
	      message = "⚠️ Name must be between 2 and 30 characters")
	@Pattern(regexp = "^[A-Za-z ]+$", message = "⚠️ Name can only contain letters and spaces")
	private String name;

	@NotBlank(message = "⚠️ Email is required")
	@Size(min = 5, max = 50, 
	      message = "⚠️ Email must be between 5 and 50 characters")
	@Email(message = "⚠️ Invalid email format")
	@Pattern(
	    regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$",
	    message = "⚠️ Email must be a valid format like user@example.com"
	)
	private String email;

	@NotBlank(message = "⚠️ Subject is required")
	@Size(min = 4, max = 50, 
	      message = "⚠️ Subject must be between 4 and 50 characters")
	private String subject;

	@NotBlank(message = "⚠️ Message is required")
	@Size(min = 5, max = 1000, 
	      message = "⚠️ Message must be between 5 and 1000 characters")
	private String message;

}




