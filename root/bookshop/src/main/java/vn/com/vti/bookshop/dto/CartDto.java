package vn.com.vti.bookshop.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import vn.com.vti.bookshop.entity.Book;

@Component
@Scope(scopeName="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class CartDto implements Serializable{
	private List<Book> bookList = new ArrayList<>();

	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	public int getSummaryPrice() {
		int result = 0;
		for (Book book : bookList) {
			result += book.getPrice();
		}
		return result;
	}
}
