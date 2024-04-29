package vn.com.vti.bookshop.mapper;

import java.util.List;

import vn.com.vti.bookshop.entity.OrderDetailWithBook;

public interface OrderDetailCustomMapper {
	public List<OrderDetailWithBook> selectByOrderHeaderId(Integer orderHeaderId);
}
