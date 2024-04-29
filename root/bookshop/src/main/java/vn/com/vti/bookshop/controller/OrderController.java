package vn.com.vti.bookshop.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bookshop.dto.CartDto;
import vn.com.vti.bookshop.entity.Book;
import vn.com.vti.bookshop.entity.OrderDetail;
import vn.com.vti.bookshop.entity.OrderDetailWithBook;
import vn.com.vti.bookshop.entity.OrderHeader;
import vn.com.vti.bookshop.entity.OrderHeaderExample;
import vn.com.vti.bookshop.mapper.OrderDetailCustomMapper;
import vn.com.vti.bookshop.mapper.OrderDetailMapper;
import vn.com.vti.bookshop.mapper.OrderHeaderMapper;
import vn.com.vti.bookshop.security.MemberDetails;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderHeaderMapper orderHeaderMapper;

	@Autowired
	private OrderDetailMapper orderDetailMapper;

	@Autowired
	private OrderDetailCustomMapper orderDetailCustomMapper;
	
	@Autowired
	private CartDto cartDto;

	@RequestMapping("/list")
	public String list(Model model, @AuthenticationPrincipal MemberDetails memberDetails) {
		//TODO ログインしている会員の注文のみを表示
		OrderHeaderExample orderHeaderExample = new OrderHeaderExample();
		orderHeaderExample.createCriteria().andMemberIdEqualTo(memberDetails.getMember().getId());
		orderHeaderExample.setOrderByClause("id desc");

		List<OrderHeader> orderHeaderList = orderHeaderMapper.selectByExample(orderHeaderExample);
		model.addAttribute("orderHeaderList", orderHeaderList);
		return "order/orderList";
	}
	
	
	@RequestMapping("/purchase")
	@Transactional
	public String purchase(@AuthenticationPrincipal MemberDetails memberDetails,
			RedirectAttributes redirectAttributes) {
		//TODO ログインしている会員の注文として登録
		OrderHeader orderHeader = new OrderHeader();
		orderHeader.setOrderDatetime(new Date());
		orderHeader.setPaymentType("BT");
		orderHeader.setMemberId(memberDetails.getMember().getId());
		orderHeaderMapper.insertSelective(orderHeader);
		
		//TODO カートに登録した書籍を注文明細に全て登録
		int i = 1;
		for(Book book : cartDto.getBookList()) {
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setItemNum(1);
			orderDetail.setItemId(book.getId());
			orderDetail.setOrderHeaderId(orderHeader.getId());
			orderDetail.setOrderDetailNo(i);
			orderDetailMapper.insertSelective(orderDetail);
			i++;
		}
		
		
		redirectAttributes.addFlashAttribute("message", "注文しました。");

		return "redirect:list";
	}

	@RequestMapping("/detail")
	public String detail(Integer orderHeaderId, Model model) {
		//TODO ログインしている会員の注文IDであるかチェック

		OrderHeader orderHeader = orderHeaderMapper.selectByPrimaryKey(orderHeaderId);
		model.addAttribute("orderHeader", orderHeader);

		List<OrderDetailWithBook> orderDetailList = orderDetailCustomMapper.selectByOrderHeaderId(orderHeaderId);

		model.addAttribute("orderDetailList", orderDetailList);

		return "order/orderDetail";
	}
}
