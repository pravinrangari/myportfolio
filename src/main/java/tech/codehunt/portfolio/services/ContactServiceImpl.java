package tech.codehunt.portfolio.services;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.codehunt.portfolio.dto.ContactDto;
import tech.codehunt.portfolio.entities.ContactEntity;
import tech.codehunt.portfolio.repositories.ContactRepository;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository contactRepository;

	@Autowired
	private ModelMapper modelMapper;

	@Override
	public ContactEntity saveContact(ContactDto contactDto) {
 

		ContactEntity contactEntity = modelMapper.map(contactDto, ContactEntity.class);
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss");
		contactEntity.setDatetime(now.format(formatter));

		return contactRepository.save(contactEntity);
	}

	@Override
	public boolean isContactEmailExist(String email) {
		// TODO Auto-generated method stub
		return contactRepository.existsByEmail(email);
	}

	@Override
	public List<ContactEntity> readAllContacts() {
		 
		return contactRepository.findAll();
	}

	@Override
	public void deleteContactById(int id) {
		contactRepository.deleteById(id);
		
	}

}
