package tech.codehunt.portfolio.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.codehunt.portfolio.entities.AddAboutEntity;

@Repository
public interface AddAboutIntroRepository extends JpaRepository<AddAboutEntity, Integer> {
	
}

