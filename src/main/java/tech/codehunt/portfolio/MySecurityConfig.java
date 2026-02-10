 package tech.codehunt.portfolio;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class MySecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeRequests()
                // Public URLs
                .antMatchers(
                    "/register",
                    "/doLogin",
                    "/forgot-password",
                    "/forgot-password/**",
                    "/reset-password",
                    "/reset-password/**",
                    "/css/**",
                    "/js/**"
                ).permitAll()
                // Admin-only
                .antMatchers(
                    "/admin/deleteService/**",
                    "/admin/deleteContactById/**",
                    "/admin/deleteAbountIntro/**"
                ).hasRole("ADMIN")
                // Admin + Member
                .antMatchers("/admin/**").hasAnyRole("ADMIN","MEMBER")
                .anyRequest().authenticated()
            .and()
            .formLogin()
                .loginPage("/client/mylogin")
                .loginProcessingUrl("/doLogin")
                .usernameParameter("username") // must match login.jsp input name
                .passwordParameter("password") // must match login.jsp input name
                .defaultSuccessUrl("/admin/home", true)
                .failureUrl("/client/mylogin?error=true")
                .permitAll()
            .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/client/mylogin?logout=true")
                .permitAll()
            .and()
            .exceptionHandling()
                .accessDeniedPage("/client/unauthorized");

        return http.build();
    }
}
