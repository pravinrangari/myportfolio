package tech.codehunt.portfolio.dto;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data    
@NoArgsConstructor
@AllArgsConstructor
public class AddAboutDto {

    @NotBlank(message = "⚠️ First paragraph is required")
    @Size(min = 2, max = 200, message = "⚠️ First paragraph must be between 2 and 200 characters")
    private String firstPara;

    @NotBlank(message = "⚠️ Second paragraph is required")
    @Size(min = 2, max = 300, message = "⚠️ Second paragraph must be between 2 and 300 characters")
    private String secondPara;
}
