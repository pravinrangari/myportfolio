package tech.codehunt.portfolio.services;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import tech.codehunt.portfolio.dto.ServiceDto;
import tech.codehunt.portfolio.entities.ServiceEntity;

public interface ServicesService {

	
	ServiceEntity saveService(String realPath,MultipartFile multipartfile,ServiceDto serviceDto) throws Exception;
	List<ServiceEntity> readServices();
	 void deleteService(String realPath, int id,String filename);
	 Optional<ServiceEntity> readService(int id);  // read one data update
ServiceEntity updateService(String realPath,MultipartFile multipartfile,ServiceDto serviceDto,int id,String OldFileName) throws Exception;
}
