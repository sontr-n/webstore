package com.webstore.app.shop.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webstore.app.entity.Bill;
import com.webstore.app.entity.BillDetail;
import com.webstore.app.entity.Product;
import com.webstore.app.entity.User;
import com.webstore.app.model.BillDto;
import com.webstore.app.model.Cart;
import com.webstore.app.model.Item;
import com.webstore.app.mysql.repo.BillDetailRepository;
import com.webstore.app.mysql.repo.BillRepository;
import com.webstore.app.mysql.repo.CategoryRepository;
import com.webstore.app.mysql.repo.ProductRepository;

@Controller
@RequestMapping("/shop")
public class ViewController {

  private @Autowired ProductRepository productRepository;
  private @Autowired CategoryRepository categoryRepository;
  private @Autowired BillRepository billRepository;
  private @Autowired BillDetailRepository billDetailRepository;
  
  @GetMapping("/homepage")
  public ModelAndView home(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("index");
    mv.addObject("products", productRepository.findAll());
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("user", request.getSession().getAttribute("user"));
    mv.addObject("menu", "homepage");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/single/{id}")
  public ModelAndView single(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("single");
    mv.addObject("product", productRepository.findById(id).get());
    mv.addObject("cates", categoryRepository.findAll());
    mv.addObject("productId", id);
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/checkout")
  public ModelAndView checkout(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("checkout");
    setDataCart(mv, request);
    mv.addObject("categories", categoryRepository.findAll());
    return mv;
  }
  
  @GetMapping("/single/product/{id}")
  public ModelAndView prodByCate(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("product");
    
    mv.addObject("products", productRepository.findByCategoryId(id));
    mv.addObject("categoryId", id);
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/delivery")
  public ModelAndView delivery(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("chinhsach");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("menu", "policy");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/contact")
  public ModelAndView contact(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("mail");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("menu", "contact");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/login")
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("login");
    mv.addObject("categories", categoryRepository.findAll());
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/register")
  public ModelAndView register() {
    ModelAndView mv = new ModelAndView("register");
    mv.addObject("categories", categoryRepository.findAll());
    return mv;
  }
  
  @GetMapping("/logout")
  public ModelAndView logout(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("logout");
    mv.addObject("categories", categoryRepository.findAll());
    request.getSession().removeAttribute("cart");
    return mv;
  }
  
  @GetMapping("/thanhtoan")
  public ModelAndView payment(HttpServletRequest request) {
    if (request.getSession().getAttribute("user") == null) return new ModelAndView("login");
    
    ModelAndView mv = new ModelAndView("thanhtoan");
    mv.addObject("categories", categoryRepository.findAll());
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/product/search")
  public ModelAndView search(@RequestParam String keyword, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("search");
    mv.addObject("products", productRepository.findByProductName(keyword));
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("menu", "product");
    
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/mail")
  public ModelAndView mail(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("mail");
    setDataCart(mv, request);
    return mv;
  }
  
  private void setDataCart(ModelAndView mv, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Double totalPrices = 0d;
    int quantity = 0;
    
    if (cart != null) {
      Map<Long, Item> datas = cart.getCartItems();
      
      for(Item i: datas.values()) {
        totalPrices += (i.getProduct().getProductPrice() * i.getQuantity());
        quantity += i.getQuantity();
      }
    } else {
      session.setAttribute("cart", cart);
    }
    
    mv.addObject("quantity", quantity);
    mv.addObject("totalPrices", totalPrices);
  }
  
  @GetMapping("/history")
  public ModelAndView buyHistory(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("bill");
    User user = (User)request.getSession().getAttribute("user");
    if (user == null) {
      mv.setViewName("login");
      return mv;
    }
    
    List<BillDto> dtos = new LinkedList<>();
    List<Bill> bills = billRepository.findByUserId(user.getId());
    
    if(bills != null && !bills.isEmpty()) {
      for (Bill b: bills) {
        List<BillDetail> details = billDetailRepository.findByBillId(b.getId());
        for(BillDetail d: details) {
            try {
              BillDto dto = new BillDto();
              dto.setDate(b.getDate());
              Product p = productRepository.findById(d.getProductId()).get();
              dto.setProductId(p.getProductID());
              dto.setProduct(p.getProductName());
              dto.setQuantity(d.getQuantity());
              dto.setPrice(d.getPrice());
              dto.setProductImage(p.getProductImage());
            
            dtos.add(dto);
            } catch (Exception e) {
              System.out.println(e.getMessage());
            }
        }
      }
    }
    mv.addObject("bills", dtos);
    mv.addObject("categories", categoryRepository.findAll());
//    setDataCart(mv, request);
    return mv;
  }
}
