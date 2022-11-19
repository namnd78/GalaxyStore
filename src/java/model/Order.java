/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author NamND
 */
public class Order {

    private int id;
    private Account account;
    private OrderState orderState;
    private String address;
    private Transport transport;
    private Timestamp orderTime;
    private double total;
    private List<OrderDetail> orderDetail;

    public Order() {
    }

    public Order(int id, Account account, OrderState orderState, String address, Transport transport, Timestamp orderTime, double total, List<OrderDetail> orderDetail) {
        this.id = id;
        this.account = account;
        this.orderState = orderState;
        this.address = address;
        this.transport = transport;
        this.orderTime = orderTime;
        this.total = total;
        this.orderDetail = orderDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public OrderState getOrderState() {
        return orderState;
    }

    public void setOrderState(OrderState orderState) {
        this.orderState = orderState;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public String getTotalVND() {
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormat.format(total);
    }
}
