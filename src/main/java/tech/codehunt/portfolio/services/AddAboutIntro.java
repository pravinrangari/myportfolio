package tech.codehunt.portfolio.services;

import java.util.List;
import java.util.Optional;

import tech.codehunt.portfolio.dto.AddAboutDto;
import tech.codehunt.portfolio.entities.AddAboutEntity;

public interface AddAboutIntro {

	AddAboutEntity saveAbountIntro(AddAboutDto addAboutDto);

	List<AddAboutEntity> readAboutIntro();
	 Optional<AddAboutEntity> readAboutIntroId(int id); 
	 AddAboutEntity updateAboutIntro(AddAboutEntity intro);
	 void deleteAbountIntroId(int id);


}
