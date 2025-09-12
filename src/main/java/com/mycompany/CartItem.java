package com.mycompany;

public class CartItem {
    private final CD cd;
    private int quantity = 1;

    public CartItem(CD cd) { this.cd = cd; }

    public CD getCd() { return cd; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotal() { return cd.getPrice() * quantity; }
}
