package vn.com.vti.bookshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bookshop.entity.Book;
import vn.com.vti.bookshop.entity.BookExample;
import vn.com.vti.bookshop.mapper.BookMapper;

@Controller
public class TopController {
	@Autowired
	private BookMapper bookMapper;

	@RequestMapping(value= {"/","/home"})
	public String index( Model model) {
		BookExample bookExample = new BookExample();
		bookExample.setOrderByClause("id");

		List<Book> bookList = bookMapper.selectByExample(bookExample);

		model.addAttribute("bookList", bookList);

		return "top/topIndex";
	}
}
