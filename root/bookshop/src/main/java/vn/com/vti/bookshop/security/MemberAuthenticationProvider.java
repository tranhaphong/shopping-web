package vn.com.vti.bookshop.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import vn.com.vti.bookshop.entity.Member;
import vn.com.vti.bookshop.mapper.MemberMapper;

@Configuration
public class MemberAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider{
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private MessageSource messageSource;

	@Override
	protected void additionalAuthenticationChecks(UserDetails userDetails,
			UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		if(!userDetails.getPassword().equals(authentication.getCredentials())) {
			throw new BadCredentialsException("ログインIDまたはパスワードに誤りがあります。");
		}
	}

	@Override
	protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication)
			throws AuthenticationException {
		if(username == null || username.isEmpty()) {
			throw new BadCredentialsException("ログインIDを入力してください。");
		}

		Member member = memberMapper.selectByPrimaryKey(Integer.parseInt(username));
		if(member == null) {
			throw new BadCredentialsException("ログインIDまたはパスワードに誤りがあります。");
		}
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER"));

		return new MemberDetails(member, authorities);
	}
}
