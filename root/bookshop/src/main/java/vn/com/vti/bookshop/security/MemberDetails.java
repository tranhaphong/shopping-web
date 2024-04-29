package vn.com.vti.bookshop.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import vn.com.vti.bookshop.entity.Member;

public class MemberDetails implements UserDetails{
	private Member member;

	private Collection<? extends GrantedAuthority> authorities;

	public MemberDetails(Member member, Collection<? extends GrantedAuthority> authorities) {
		super();
		this.member = member;
		this.authorities = authorities;
	}

	public Member getMember() {
		return member;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return member.getPassword();
	}

	@Override
	public String getUsername() {
		return member.getId().toString();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
