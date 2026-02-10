package tech.codehunt.portfolio.services;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tech.codehunt.portfolio.dto.ServiceDto;
import tech.codehunt.portfolio.entities.ServiceEntity;
import tech.codehunt.portfolio.repositories.ServiceRepository;

@Service
public class ServicesServiceImpl implements ServicesService {

	@Autowired
	private ServiceRepository serviceRepository;

	@Autowired
	private ModelMapper modelMapper;

	@Transactional(rollbackOn = Exception.class)
	@Override
	public ServiceEntity saveService(String realPath, MultipartFile multipartfile, ServiceDto serviceDto)
			throws Exception {
		String filename = UUID.randomUUID().toString() + LocalDateTime.now().toString().replace(":", "a")
				+ multipartfile.getOriginalFilename();

		ServiceEntity serviceEntity = modelMapper.map(serviceDto, ServiceEntity.class);
		serviceEntity.setFilename(filename);
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss");
		serviceEntity.setDatetime(now.format(formatter));

		ServiceEntity entity = serviceRepository.save(serviceEntity);

		Path path = Paths.get(realPath, filename);
		File file = path.toFile();

		multipartfile.transferTo(file);
		return entity;
	}

	@Override
	public List<ServiceEntity> readServices() {

		return serviceRepository.findAll();
	}

 

	@Transactional(rollbackOn = Exception.class)
	@Override
	public void deleteService(String realPath, int id, String filename) {

		serviceRepository.deleteById(id);

		File file = new File(realPath + File.separator + filename);
		file.delete();

	}

	@Override
	public Optional<ServiceEntity> readService(int id) {

		return serviceRepository.findById(id);
	}

	@Override
	@Transactional(rollbackOn = Exception.class)
	public ServiceEntity updateService(String realPath, MultipartFile multipartfile, ServiceDto serviceDto, int id,
			String OldFileName) throws Exception {
		
		// new fileName
		String filename = UUID.randomUUID().toString() + LocalDateTime.now().toString().replace(":", "a")
				+ multipartfile.getOriginalFilename();

		
		if(multipartfile!=null && !multipartfile.isEmpty()) {
			ServiceEntity serviceEntity = modelMapper.map(serviceDto, ServiceEntity.class);
			serviceEntity.setFilename(filename); // new fileName
			serviceEntity.setId(id);
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss");
			serviceEntity.setDatetime(now.format(formatter));

			ServiceEntity entity = serviceRepository.save(serviceEntity);
			
			//old file delete
			File file = new File(realPath + File.separator + OldFileName);
			file.delete();
			
			
			// new file add
			Path path = Paths.get(realPath, filename);
			File file1 = path.toFile();

			multipartfile.transferTo(file);

			
			return entity;
		}
		else {
			
			//old file
			ServiceEntity serviceEntity = modelMapper.map(serviceDto, ServiceEntity.class);
			serviceEntity.setFilename(OldFileName);
			serviceEntity.setId(id);
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss");
			serviceEntity.setDatetime(now.format(formatter));

			ServiceEntity entity = serviceRepository.save(serviceEntity);
			
			return entity;
		}
		 
	}

}
