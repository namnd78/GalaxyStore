/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author ADMIN
 */
public class Cart {

    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<CartItem> items) {
        this.items = items;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public CartItem getItemById(int id) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    public void addItem(CartItem item) {
        if (getItemById(item.getProduct().getId()) != null) {
            CartItem itemInCart = getItemById(item.getProduct().getId());
            itemInCart.setQuantity(itemInCart.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    public void removeItem(CartItem item) {
        if (getItemById(item.getProduct().getId()) != null) {
            items.remove(item);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getQuantity() * item.getProduct().getNewPrice();
        }
        return total;
    }

    public String getTotalMoneyVND() {
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormat.format(getTotalMoney());
    }
}
