/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author NamND
 */
public class Product {

    private int id;
    private String name;
    private Category category;
    private Brand brand;
    private Date releaseDate;
    private String description;
    private String specification;
    private double price;
    private int discount;
    private int quantity;
    private State state;
    private Store store;
    private List<Image> images;

    public Product() {
    }

    public Product(int id, String name, Category category, Brand brand, Date releaseDate, String description, String specification, double price, int discount, int quantity, State state, Store store, List<Image> images) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.brand = brand;
        this.releaseDate = releaseDate;
        this.description = description;
        this.specification = specification;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.state = state;
        this.store = store;
        this.images = images;
    }
    public Product(int id, String name, Category category, Brand brand,String description, String specification, double price, int quantity,List<Image> images){
        this.id = id;
        this.name = name;
        this.category = category;
        this.brand = brand;
        this.description = description;
        this.specification = specification;
        this.price = price;
        this.quantity = quantity;
        this.images = images;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public double getPrice() {
        return price;
    }
    
    public int getPrice1(){
        int price1 = (int) Math.round(price);
        return price1;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public double getNewPrice() {
        return (price - price * discount / 100) - ((price - price * discount / 100) % 1000);
    }

    public String getOldPriceVND() {
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormat.format(price);
    }

    public String getNewPriceVND() {
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormat.format(getNewPrice());
    }

    public boolean isNew() {
        if (releaseDate.toString().contains("2022")) {
            return true;
        }
        return false;
    }

    public boolean isSale() {
        if (discount > 0) {
            return true;
        }
        return false;
    }
}
