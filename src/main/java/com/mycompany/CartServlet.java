package com.mycompany;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name="CartServlet", urlPatterns={"/cart"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = getCart(session);

        String action = req.getParameter("action");
        String code   = req.getParameter("code");

        if (action != null) switch (action) {
            case "add":
                String desc = req.getParameter("desc");
                double price = Double.parseDouble(req.getParameter("price"));
                cart.add(new CD(code, desc, price));
                break;
            case "update":
                int qty = Integer.parseInt(req.getParameter("quantity"));
                cart.update(code, qty);
                break;
            case "remove":
                cart.remove(code);
                break;
            default:
                // no-op
                break;
        }

        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // cho phép mở /cart trực tiếp
        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }
}
