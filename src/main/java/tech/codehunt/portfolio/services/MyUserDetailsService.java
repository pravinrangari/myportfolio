 package tech.codehunt.portfolio.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tech.codehunt.portfolio.entities.AppUser;
import tech.codehunt.portfolio.repositories.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<AppUser> opUser = userRepository.findByUsername(username);

        if (!opUser.isPresent()) {
            throw new UsernameNotFoundException("User Not found: " + username);
        }

        AppUser appUser = opUser.get();

        // ✅ Build and return UserDetails
        return User.builder()
                .username(appUser.getUsername())
                .password(appUser.getPassword())  // must already be encoded
                .roles(appUser.getRole().replace("ROLE_", "")) 
                .build();
    }
}
