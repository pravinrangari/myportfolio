 package tech.codehunt.portfolio.services;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.codehunt.portfolio.dto.AddAboutDto;
import tech.codehunt.portfolio.entities.AddAboutEntity;
import tech.codehunt.portfolio.repositories.AddAboutIntroRepository;

@Service
public class AddAbountIntroImpl implements AddAboutIntro {

    @Autowired
    private AddAboutIntroRepository addAbountIntroRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public AddAboutEntity saveAbountIntro(AddAboutDto addAboutDto) {
        // Convert DTO to Entity
        AddAboutEntity about = modelMapper.map(addAboutDto, AddAboutEntity.class);

        // Save entity in 
        return addAbountIntroRepository.save(about);
    }

	@Override
	public List<AddAboutEntity> readAboutIntro() {
		 
		return addAbountIntroRepository.findAll();
	}

	@Override
	public Optional<AddAboutEntity> readAboutIntroId(int id) {
		// TODO Auto-generated method stub
		return addAbountIntroRepository.findById(id);
	}

	 @Override
	    public AddAboutEntity updateAboutIntro(AddAboutEntity intro) {
	        return addAbountIntroRepository.save(intro);  
}

	 @Override
	 public void deleteAbountIntroId(int id) {
		 
		 addAbountIntroRepository.deleteById(id);
	 }
}
