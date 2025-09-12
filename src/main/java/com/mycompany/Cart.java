package com.mycompany;

import java.util.*;

public class Cart {
    private final Map<String, CartItem> items = new LinkedHashMap<>();

    public void add(CD cd) {
        CartItem it = items.get(cd.getCode());
        if (it == null) {
            items.put(cd.getCode(), new CartItem(cd));
        } else {
            it.setQuantity(it.getQuantity() + 1);
        }
    }

    public void update(String code, int qty) {
        CartItem it = items.get(code);
        if (it == null) return;
        if (qty <= 0) items.remove(code);
        else it.setQuantity(qty);
    }

    public void remove(String code) { items.remove(code); }

    public Collection<CartItem> getItems() { return items.values(); }

    public boolean isEmpty() { return items.isEmpty(); }
}
