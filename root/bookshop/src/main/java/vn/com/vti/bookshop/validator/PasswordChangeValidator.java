package vn.com.vti.bookshop.validator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bookshop.entity.Member;
import vn.com.vti.bookshop.form.PasswordChangeForm;
import vn.com.vti.bookshop.mapper.MemberMapper;
import vn.com.vti.bookshop.security.MemberDetails;

@Component
public class PasswordChangeValidator implements Validator{
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {
		if(!(target instanceof PasswordChangeForm)) {
			return;
		}
		PasswordChangeForm passwordChangeForm = (PasswordChangeForm)target;

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();

		Member member = memberMapper.selectByPrimaryKey(memberDetails.getMember().getId());
		if(member.getPassword().equals(passwordChangeForm.getPassword1())) {
			errors.rejectValue("password1", "error.sameStoredPassword");
		}
	}

}
