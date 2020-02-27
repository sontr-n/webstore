package com.webstore.app.shop.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webstore.app.entity.Bill;
import com.webstore.app.entity.BillDetail;
import com.webstore.app.entity.User;
import com.webstore.app.model.Cart;
import com.webstore.app.model.Item;
import com.webstore.app.mysql.repo.BillDetailRepository;
import com.webstore.app.mysql.repo.BillRepository;

@Controller
@RequestMapping("/checkout")
public class CheckoutContrller {
  
  public @Autowired BillRepository billRepository;
  public @Autowired BillDetailRepository billDetailRepository;

  @PostMapping("")
  public String checkout(@RequestParam String payment, @RequestParam String address, @RequestParam String phone, HttpServletRequest request){

      String product = "";
      long quantity = 0;
      double price = 0;
      HttpSession session = request.getSession();
      Cart cart = (Cart) session.getAttribute("cart");
      User user = (User) session.getAttribute("user");
      try {
          Bill bill = new Bill();
          bill.setAddress(address);
          bill.setPayment(payment);
          bill.setUserId(user.getId());
          bill.setDate(new Date());
          bill.setTotal(cart.totalCart());
          bill.setStatus((short)1);
          bill.setPhone(phone);
          bill.setNoti(false);
          billRepository.save(bill);
          
          for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
            billDetailRepository.save(new BillDetail(bill.getId(),
                      list.getValue().getProduct().getProductID(),
                      list.getValue().getProduct().getProductPrice(),
                      list.getValue().getQuantity()));

              product = list.getValue().getProduct().getProductName();
              quantity = list.getValue().getQuantity();
              price = list.getValue().getProduct().getProductPrice();
          }

          /*SendMail sm = new SendMail();
          SendMail.sendMail(users.getUserEmail(), "Thông tin đơn đặt hàng",
                  "Thông tin đơn hàng,  " + users.getUserEmail()
                  + "\nNameProduct: " + product
                  + "\nPrice: " + price
                  + "\nQuantity: " + quantity
                  + "\nTotal: " + cart.totalCart());*/
          cart = new Cart();
          session.setAttribute("cart", cart);
      } catch (Exception e) {

      }
      return ("redirect:/shop/homepage");
  }

}
