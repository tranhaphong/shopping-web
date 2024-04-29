package vn.com.vti.bookshop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import vn.com.vti.bookshop.security.MemberAuthenticationProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private MemberAuthenticationProvider authenticationProvider;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/auth")
				.defaultSuccessUrl("/");

		http.authorizeRequests()
				.antMatchers("/", "/login", "/cart/*", "/css/*", "/img/*").permitAll()
				.anyRequest()
				.authenticated();

		http.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/");
	}

}
