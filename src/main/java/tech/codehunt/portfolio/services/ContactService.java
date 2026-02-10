package tech.codehunt.portfolio.services;

import java.util.List;

import tech.codehunt.portfolio.dto.ContactDto;
import tech.codehunt.portfolio.entities.ContactEntity;

public interface ContactService {
	
	ContactEntity saveContact(ContactDto contactDto);
	boolean isContactEmailExist(String email);
	List<ContactEntity> readAllContacts();
	void deleteContactById(int id);

}
