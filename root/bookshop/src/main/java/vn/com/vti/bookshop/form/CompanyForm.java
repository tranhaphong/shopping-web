package vn.com.vti.bookshop.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class CompanyForm {

	@NotBlank
	private String name;

	@NotNull
	private Integer businessTypeId;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getBusinessTypeId() {
		return businessTypeId;
	}
	public void setBusinessTypeId(Integer businessTypeId) {
		this.businessTypeId = businessTypeId;
	}
}
