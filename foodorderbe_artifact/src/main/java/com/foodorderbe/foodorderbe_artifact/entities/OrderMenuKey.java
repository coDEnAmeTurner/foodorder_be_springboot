package com.foodorderbe.foodorderbe_artifact.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class OrderMenuKey implements Serializable{

    @Column(name = "orderId")
    private int orderId;

    @Column(name = "menuId")
    private int menuId;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public OrderMenuKey() {
    }

    public OrderMenuKey(int orderId, int menuId) {
        this.orderId = orderId;
        this.menuId = menuId;
    }

    
}
