package tech.codehunt.portfolio;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import tech.codehunt.portfolio.entities.AppUser;
import tech.codehunt.portfolio.repositories.UserRepository;

@SpringBootApplication
public class PortfolioApplication {

    public static void main(String[] args) {
        SpringApplication.run(PortfolioApplication.class, args);
    }

    @Bean
    CommandLineRunner initUsers(UserRepository userRepo, PasswordEncoder encoder) {
        return args -> {

            if (userRepo.findByUsername("admin").isEmpty()) {
                AppUser admin = new AppUser();
                admin.setUsername("admin");
                admin.setEmail("admin@codehunt.tech");
                admin.setPassword(encoder.encode("admin123"));
                admin.setRole("ROLE_ADMIN");

                userRepo.save(admin);
                System.out.println("✅ Admin user created");
            } else {
                System.out.println("ℹ️ Admin already exists");
            }
        };
    }
}
