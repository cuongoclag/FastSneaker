package com.devpro.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthenticationSuccessHandler successHandler;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		// TODO Auto-generated method stub
		return super.authenticationManager();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception  {
		http
	    .csrf().disable();
		
		http
	    .authorizeRequests()
			.antMatchers("/admin/home").hasAnyAuthority("ADMIN")
	    	.antMatchers("/").permitAll()
		    .and()
		.formLogin()
		    .loginPage("/login")
		    .usernameParameter("username")
			.passwordParameter("password")
			.successHandler(successHandler)
			.failureUrl("/login?login_error=true")
		    .and()
		 .logout()
		    .logoutUrl("/logout")
		    .logoutSuccessUrl("/login?logout")
            .and()
		.exceptionHandling().accessDeniedPage("/login?accessDenied");
//		http.csrf().disable().authorizeRequests() // thực hiện xác thực request ngưười dùng gửi lên.
//			
//			// không thực hiện xác thực đối với các ur/ này.
//	            .antMatchers("/css/**", "/js/**", "/img/**", "/vendor/**"
//	            		, "/font-awesome/**", "/summernote/**", "/files/**").permitAll()
//	            
//	            // thực hiện xác thực với các url kiểu ..../admin/....
//	            //.antMatchers("/admin/home").hasAnyAuthority("ADMIN")
//	//            .antMatchers("/admin/**").authenticated()
//		        .antMatchers("/home").hasRole("USER")
//				.antMatchers("/admin/home").hasRole("ADMIN")
//	            .and() // kết hợp với điều kiện.
//            .formLogin()
//	            .loginPage("/login")
//			    .usernameParameter("username")
//				.passwordParameter("password")
//				.successHandler(successHandler)
//				//.loginProcessingUrl("/login") 
//				.failureUrl("/login?login_error=true")
//				.and()
//			.logout()
//			    .logoutUrl("/logout")
//			    .logoutSuccessUrl("/home")
//	            .permitAll()
//				.and()
//			.exceptionHandling().accessDeniedPage("/login?accessDenied");
            
            // khi click vào button logout thì không cần login.
            // khi click vào button này thì dữ liệu user trên session sẽ bị xoá.
//            .logout()
//            .logoutUrl("/logout")
//            .logoutSuccessUrl("/home")
//            .invalidateHttpSession(true) // xoá hết dữ liệu trên seesion
//            .deleteCookies("JSESSIONID") // xoá hết dữ liệu trên cokies.
//            .permitAll()
//            
//            .and() // kết hợp với điều kiện.
//            
//            .formLogin() // thực hiện xác thực qua form(username và password)
//            .loginPage("/login") // trang login do mình thiết kế.
//            .loginProcessingUrl("/perform_login") // link action for form post.
//            .defaultSuccessUrl("/home", true) // when user success authenticated then go to this url.
//            .failureUrl("/login?login_error=true") // nhập username, password sai thì redirect về trang nào.
//            .permitAll();
	}
	
}
