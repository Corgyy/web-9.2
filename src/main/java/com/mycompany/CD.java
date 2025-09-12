package com.mycompany;

public class CD {
    private final String code;
    private final String description;
    private final double price;

    public CD(String code, String description, double price) {
        this.code = code;
        this.description = description;
        this.price = price;
    }
    public String getCode() { return code; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }
}
